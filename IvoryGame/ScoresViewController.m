//
//  ScoresViewController.m
//  IvoryGame
//
//  Created by Miroslav Ivanov on 2/7/16.
//  Copyright © 2016 Miroslav Ivanov. All rights reserved.
//

#import "ScoresViewController.h"
#import <Parse/Parse.h>
#import "AppDelegate.h"

@interface ScoresViewController ()
@property (weak, nonatomic) IBOutlet UILabel *currentPlayerScore;
@property (weak, nonatomic) IBOutlet UILabel *oponentPlayerScore;

@end

@implementation ScoresViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    UIImage *backgroundImage = [UIImage imageNamed:@"camouflage.png"];
    UIImageView *backgroundImageView=[[UIImageView alloc]initWithFrame:self.view.frame];
    backgroundImageView.image=backgroundImage;
    [self.view insertSubview:backgroundImageView atIndex:0];
    
    self.currentPlayerScore.text = [NSString stringWithFormat:@"Your score is: %@", self.scoresArray[0]];
    self.oponentPlayerScore.text = [NSString stringWithFormat:@"Oponent score is: %@", self.scoresArray[1]];
    
    appDelegate.currentPlayer.score += [self.scoresArray[0] integerValue];
    
    [appDelegate.currentPlayer saveInBackground];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
