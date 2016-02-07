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

@interface JoinGameViewController ()
@property NSArray* games;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UITableView *gamesTableView;
@property BOOL gamesLoaded;

@end

@implementation JoinGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gamesLoaded = NO;
    [self.gamesTableView  setHidden:YES];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Game"];
    [query whereKeyDoesNotExist:@"joinedPlayer"];
    query.limit = 15;
    
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        self.games = objects;
        self.gamesLoaded = YES;
    }];
    
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
    
    static NSString *cellIdentifier = @"uniqueCellIdentifierForGames";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = self.games[indexPath.row][@"gameName"];
    
    return cell;
}
@end
