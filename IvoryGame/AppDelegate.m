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
    // Override point for customization after application launch.
    
    [Parse setApplicationId:@"lT7AEtBWrdY0IRZNu87dPUUJKtvbEJBaALtSQAqJ" clientKey:@"HqpY7tEwDz4iIYhzrcR30Daz2AyGwE8F4ThSQPsN"];
//    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
//    testObject[@"foo"] = @123;
//    [testObject saveInBackground];
//    
//    IGPlayer *player = [IGPlayer object];
//    player.score = 123;
//    player.visibleName = @"Pesho";
//
//    NSString *deviceId = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
//    player.uniqueIdentifier = deviceId;
//    
//        UIImage *defaultProfileImg = [UIImage imageNamed:@"default-profile-pic"];
//        NSData *imageData = UIImagePNGRepresentation(defaultProfileImg);
//        player.profilePicture = [PFFile fileWithData:imageData];
//    
//    
//    [player saveInBackground];
    
    IGPlayer *player = [IGPlayer initializePlayer];
    
    [player saveInBackground];
    
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
