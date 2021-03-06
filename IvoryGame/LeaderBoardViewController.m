//
//  LeaderBoardViewController.m
//  IvoryGame
//
//  Created by Miroslav Ivanov on 2/3/16.
//  Copyright © 2016 Miroslav Ivanov. All rights reserved.
//

#import "LeaderBoardViewController.h"
#import "AppDelegate.h"
#import "IGPlayer.h"

@interface LeaderBoardViewController ()

@property NSArray *leaderBoardData;

@property (weak, nonatomic) IBOutlet UITableView *tableViewLeaders;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation LeaderBoardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.leaderBoardData = appDelegate.leaderboardData;
    self.tableViewLeaders.dataSource = self;

    UIImage *backgroundImage = [UIImage imageNamed:@"camouflage.png"];
    UIImageView *backgroundImageView=[[UIImageView alloc]initWithFrame:self.view.frame];
    backgroundImageView.image=backgroundImage;
    [self.view insertSubview:backgroundImageView atIndex:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        return self.leaderBoardData.count;
}

//TODO: change to get data in background
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //UITableViewCell *cell = [[UITableViewCell alloc] init];

    static NSString *cellIdentifier = @"uniqueCellIdentifier876";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    IGPlayer *player = [self.leaderBoardData objectAtIndex:indexPath.row];
    PFFile *image = player[@"profilePicture"];
    
    cell.imageView.image = [UIImage imageWithData: [image getData]];
    cell.backgroundColor = [UIColor colorWithRed:1.00 green:1.00 blue:1.00 alpha:0.0];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ -> %@ points", player[@"visibleName"], player[@"score"]];
    
    return cell;
}

@end
