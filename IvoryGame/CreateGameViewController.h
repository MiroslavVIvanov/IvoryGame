//
//  CreateGameViewController.h
//  IvoryGame
//
//  Created by Miroslav Ivanov on 2/3/16.
//  Copyright © 2016 Miroslav Ivanov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IGGame.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface CreateGameViewController : UIViewController <CLLocationManagerDelegate>

@property NSString* createdGameId;

@end
