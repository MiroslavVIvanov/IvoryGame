//
//  JoinGameViewController.m
//  IvoryGame
//
//  Created by Miroslav Ivanov on 2/3/16.
//  Copyright © 2016 Miroslav Ivanov. All rights reserved.
//

#import "JoinGameViewController.h"
#import "ToastView.h"
#import <Parse/Parse.h>
#import "IGGameTable.h"
#import "IGGame.h"
#import "AppDelegate.h"

@interface JoinGameViewController ()

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UITableView *gamesTableView;
@property BOOL gamesLoaded;

@property IGGame* gameSelected;

@end

@implementation JoinGameViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *backgroundImage = [UIImage imageNamed:@"camouflage.png"];
    UIImageView *backgroundImageView=[[UIImageView alloc]initWithFrame:self.view.frame];
    backgroundImageView.image=backgroundImage;
    [self.view insertSubview:backgroundImageView atIndex:0];
    
    self.gamesLoaded = NO;
    [self.gamesTableView  setHidden:YES];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Game"];
    [query whereKeyDoesNotExist:@"joinedPlayer"];
    query.limit = 15;
    
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        self.games = objects;
        self.gamesLoaded = YES;
    }];
    self.gamesTableView.delegate = self;
    self.gamesTableView.dataSource = self;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    while (YES) {
        if (self.gamesLoaded) {
            [self.gamesTableView setHidden:NO];
            [self.activityIndicator setHidden:YES];
            [self.gamesTableView reloadData];
            self.gamesLoaded = NO;
            break;
        }
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.games.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    static NSString *cellIdentifier = @"uniqueCellIdentifierForGames123";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = self.games[indexPath.row][@"gameName"];
    
    //NSLog(@"%@", cell.textLabel.text);
    cell.backgroundColor = [UIColor colorWithRed:1.00 green:1.00 blue:1.00 alpha:0.0];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    self.gameSelected = self.games[indexPath.row];
    self.gameSelected[@"joinedPlayer"] = appDelegate.currentPlayer;
    
    [self.gameSelected saveInBackground];
    
    [self performSegueWithIdentifier:@"joinGameNavigate" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ( [[segue identifier] isEqualToString:@"joinGameNavigate"] & [segue.destinationViewController respondsToSelector:@selector(setGameTable:)]) {
        [segue.destinationViewController performSelector:@selector(setGameTable:)
                                              withObject:self.gameSelected[@"gameTable"]];
    }
}

@end
