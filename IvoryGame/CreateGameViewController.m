//
//  CreateGameViewController.m
//  IvoryGame
//
//  Created by Miroslav Ivanov on 2/3/16.
//  Copyright © 2016 Miroslav Ivanov. All rights reserved.
//

#import "CreateGameViewController.h"
#import <Parse/Parse.h>
#import "AppDelegate.h"
#import "ToastView.h"

#import "IGGame.h"

@interface CreateGameViewController ()
@property (weak, nonatomic) IBOutlet UITextField *gameName;
- (IBAction)createGameTap:(id)sender;

@end

@implementation CreateGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *backgroundImage = [UIImage imageNamed:@"camouflage.png"];
    UIImageView *backgroundImageView=[[UIImageView alloc]initWithFrame:self.view.frame];
    backgroundImageView.image=backgroundImage;
    [self.view insertSubview:backgroundImageView atIndex:0];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)createGameTap:(id)sender {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    IGGame *game = [IGGame object];
    IGGameTable *gameTable = [IGGameTable create];
    
    if (self.gameName.text.length > 0) {
        game[@"gameName"] = self.gameName.text;
        game[@"gameTable"] = gameTable;
        game[@"creatorPlayer"] = appDelegate.currentPlayer;
        //TODO: current location to game
        
        
        [game saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
            if (succeeded) {
                self.createdGameId = game.objectId;
                appDelegate.currentGameId = self.createdGameId;
            }
        }];
        [self performSegueWithIdentifier:@"createToWaitSegue" sender:self];

    }else{
        [ToastView showToastInParentView:self.view withText:@"Game name is required" withDuaration:3.0];
    }
}
@end
