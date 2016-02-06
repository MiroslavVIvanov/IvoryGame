//
//  AppDelegate.m
//  IvoryGame
//
//  Created by Miroslav Ivanov on 2/1/16.
//  Copyright © 2016 Miroslav Ivanov. All rights reserved.
//

#import "AppDelegate.h"

#import <Parse/Parse.h>

#import "IGPlayer.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //set property UUID
    self.UUID = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    
    //set Parse.com keys
    [Parse setApplicationId:@"lT7AEtBWrdY0IRZNu87dPUUJKtvbEJBaALtSQAqJ" clientKey:@"HqpY7tEwDz4iIYhzrcR30Daz2AyGwE8F4ThSQPsN"];

    //check if first time starting of the app
    PFQuery *query = [PFQuery queryWithClassName:@"Player"];
    [query whereKey:@"uniqueIdentifier" equalTo:self.UUID];

    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        //create initial player for current device
        if (objects.count == 0) {
            IGPlayer *player = [IGPlayer initializePlayer];
            [player saveInBackground];
        }
    }];
    
    //set property leaderboard (get top 10 players from Parse.com)
    PFQuery *leaderBoardQuery = [PFQuery queryWithClassName:@"Player"];
    [leaderBoardQuery orderByDescending:@"score"];
    leaderBoardQuery.limit = 10;
    
    [leaderBoardQuery findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        self.leaderboardData = objects;
    }];
    
    //get profile pic
    PFQuery *profilePicQuery = [PFQuery queryWithClassName:@"Player"];
    [profilePicQuery whereKey:@"uniqueIdentifier" equalTo:self.UUID];
    [profilePicQuery findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        IGPlayer *currentPlayer = objects[0];
        PFFile *image = currentPlayer[@"profilePicture"];
        
        [image getDataInBackgroundWithBlock:^(NSData * _Nullable data, NSError * _Nullable error) {
            UIImage *img = [UIImage imageWithData:data];
            self.profilePic = img;
        }];
        
    }];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
