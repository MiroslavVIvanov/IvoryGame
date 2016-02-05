//
//  AppDelegate.h
//  IvoryGame
//
//  Created by Miroslav Ivanov on 2/1/16.
//  Copyright © 2016 Miroslav Ivanov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property BOOL isVibrationOn;

@property BOOL isSoundOn;

@property NSString* UUID;

@end

