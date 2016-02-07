//
//  WaitingForPlayerViewController.m
//  IvoryGame
//
//  Created by Miroslav Ivanov on 2/7/16.
//  Copyright © 2016 Miroslav Ivanov. All rights reserved.
//

#import "WaitingForPlayerViewController.h"
#import "CreateGameViewController.h"
#import "AppDelegate.h"

#import <Parse/Parse.h>

@interface WaitingForPlayerViewController ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (weak, nonatomic) IBOutlet UILabel *joinedPlayerName;
@property (weak, nonatomic) IBOutlet UIImageView *joinedPlayerImg;

@property (weak, nonatomic) IBOutlet UIButton *beginGameBtn;

@property NSTimer* saveTimer;

@property IGGame *currentGame;

@end

@implementation WaitingForPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    UIImage *backgroundImage = [UIImage imageNamed:@"camouflage.png"];
    UIImageView *backgroundImageView=[[UIImageView alloc]initWithFrame:self.view.frame];
    backgroundImageView.image=backgroundImage;
    [self.view insertSubview:backgroundImageView atIndex:0];
    
//    [self.joinedPlayerImg setHidden:YES];
    [self.joinedPlayerName setHidden:YES];
    self.beginGameBtn.enabled = NO;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    while (YES) {
        PFQuery *query = [PFQuery queryWithClassName:@"Game"];
        [query whereKey:@"creatorPlayer" equalTo:appDelegate.currentPlayer];
        [query whereKeyDoesNotExist:@"joinedPlayer"];
        self.currentGame = [query getFirstObject];
        if (self.currentGame) {
            break;
        }
    }
    
    self.saveTimer = [NSTimer scheduledTimerWithTimeInterval:2.0
                                                      target:self
                                                    selector:@selector(saveMethod:)
                                                    userInfo:nil
                                                     repeats:YES];
}

- (void)saveMethod:(NSTimer*)theTimer {
    PFQuery *query = [PFQuery queryWithClassName:@"Game"];
            [query whereKey:@"ObjectId" equalTo:self.currentGame.objectId];
            [query whereKeyExists:@"joinedPlayer"];
            [query getFirstObjectInBackgroundWithBlock:^(PFObject * _Nullable object, NSError * _Nullable error) {
                if (object) {
                    [self.joinedPlayerName setHidden:NO];
                    self.beginGameBtn.enabled = YES;
    
                    [self.activityIndicator setHidden:YES];
    
                    NSLog(@"___________Player %@ has joined your game!", object[@"joinedPlayer"][@"visibleName"]);
    
                    self.joinedPlayerName.text = [NSString stringWithFormat:@"Player %@ has joined your game!", object[@"joinedPlayer"][@"visibleName"]];
                }
    
            }];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // Stop timer
    [self.saveTimer invalidate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
