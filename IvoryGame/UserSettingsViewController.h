//
//  UserSettingsViewController.h
//  IvoryGame
//
//  Created by Miroslav Ivanov on 2/3/16.
//  Copyright © 2016 Miroslav Ivanov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface UserSettingsViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

-(IBAction)openCamera:(id)sender;

@end
