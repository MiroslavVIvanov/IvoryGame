//
//  UserSettingsViewController.m
//  IvoryGame
//
//  Created by Miroslav Ivanov on 2/3/16.
//  Copyright © 2016 Miroslav Ivanov. All rights reserved.
//

#import "UserSettingsViewController.h"
#import "AppDelegate.h"
#import "Parse/Parse.h"
#import "ToastView.h"

@interface UserSettingsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *profilePicImageView;
@property (weak, nonatomic) IBOutlet UITextField *visibleNameTextField;
@property AppDelegate *appDelegate;

- (IBAction)openCamera:(id)sender;

- (IBAction)updateVisibleNameTap:(id)sender;


@end

@implementation UserSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *backgroundImage = [UIImage imageNamed:@"camouflage.png"];
    UIImageView *backgroundImageView=[[UIImageView alloc]initWithFrame:self.view.frame];
    backgroundImageView.image=backgroundImage;
    [self.view insertSubview:backgroundImageView atIndex:0];

    
    
    self.appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.profilePicImageView.image = self.appDelegate.profilePic;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//- (IBAction)updateInfoTap:(id)sender {
////    if (self.visibleNameTextField.text != nil) {
////        PFQuery *query = [PFQuery queryWithClassName:@"Player"];
////        [query whereKey: @"uniqueIdentifier" equalTo:self.appDelegate.UUID];
////    }else{
////    }
//    [ToastView showToastInParentView:self.profilePicImageView withText:@"Visible name field is empty" withDuaration:5.0f];
//    
//    
//    
//}

-(void)openCamera:(id)sender{
    [self launchCameraControllerFromViewController:self usingDelegate:self];
}

- (IBAction)updateVisibleNameTap:(id)sender {
    if (self.visibleNameTextField.text.length > 0) {
        PFQuery *query = [PFQuery queryWithClassName:@"Player"];
        [query whereKey: @"uniqueIdentifier" equalTo:self.appDelegate.UUID];
    } else{
        [ToastView showToastInParentView:self.view withText:@"Visible name field is empty" withDuaration:3.0f];
    }
}

-(BOOL) launchCameraControllerFromViewController: (UIViewController*) controller usingDelegate: (id <UIImagePickerControllerDelegate, UINavigationControllerDelegate>) delegate {
    BOOL truefalse = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
    
    if (!truefalse || (delegate == nil) || (controller == nil)) {
        NSLog(@"no can do, delegate/camera/view controller doesn't exist!");
        return NO;
    }
    UIImagePickerController *cameraController = [[UIImagePickerController alloc] init];
    cameraController.sourceType = UIImagePickerControllerSourceTypeCamera;
    cameraController.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
    cameraController.allowsEditing = NO;
    cameraController.delegate = delegate;
    [controller presentModalViewController:cameraController animated:YES];
    return true;
}

- (void) imagePickerControllerDidCancel: (UIImagePickerController *) picker {
    [picker dismissModalViewControllerAnimated:YES];
}

- (void) imagePickerController: (UIImagePickerController*) picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];
    UIImage *originalImage, *editedImage, *imageToSave;
    if (CFStringCompare ((CFStringRef) mediaType, kUTTypeImage, 0)
        == kCFCompareEqualTo) {//if it's an image
        
        editedImage = (UIImage *) [info objectForKey:
                                   UIImagePickerControllerEditedImage]; //Assign the edited image to editedImage
        originalImage = (UIImage *) [info objectForKey:
                                     UIImagePickerControllerOriginalImage]; //Assign the original image to originalImage
        //Check to see if there was indeed an edited image, if so use that, otherwise use the original
        if (editedImage) {
            imageToSave = editedImage;
        } else {
            imageToSave = originalImage;
        }
        
        // Save the image to the Camera Roll
        UIImageWriteToSavedPhotosAlbum (imageToSave, nil, nil , nil);
    }
    [picker dismissModalViewControllerAnimated: YES]; //Dismiss the controller
    [self.profilePicImageView setImage:imageToSave];
}

@end
