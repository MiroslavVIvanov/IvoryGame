//
//  PlayingViewController.m
//  IvoryGame
//
//  Created by Miroslav Ivanov on 2/7/16.
//  Copyright © 2016 Miroslav Ivanov. All rights reserved.
//

#import "PlayingViewController.h"

@interface PlayingViewController ()

@property (weak, nonatomic) IBOutlet UILabel *oponentOne;
@property (weak, nonatomic) IBOutlet UILabel *oponentTwoLable;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *oponentTwo;
@property (weak, nonatomic) IBOutlet UILabel *oponentThree;
@property (weak, nonatomic) IBOutlet UILabel *oponentFour;
@property (weak, nonatomic) IBOutlet UILabel *oponentFive;
@property (weak, nonatomic) IBOutlet UILabel *oponentSix;
@property (weak, nonatomic) IBOutlet UILabel *oponentPair;
@property (weak, nonatomic) IBOutlet UILabel *oponentThreeSame;
@property (weak, nonatomic) IBOutlet UILabel *oponentFourSame;
@property (weak, nonatomic) IBOutlet UILabel *oponentSmall;
@property (weak, nonatomic) IBOutlet UILabel *oponentBig;
@property (weak, nonatomic) IBOutlet UILabel *oponentFull;
@property (weak, nonatomic) IBOutlet UILabel *oponentGeneral;
@property (weak, nonatomic) IBOutlet UILabel *oponentChance;

@end

@implementation PlayingViewController

- (IBAction)inputOne:(UITextField*)sender {
    self.gameTable.creatorOneSum = [sender.text intValue];
    [self.gameTable saveInBackground];
    [self fetchAndRefresh];
    if (sender.text.length > 0) {
        sender.enabled = NO;
    }

}
- (IBAction)inputTwo:(UITextField*)sender {
    self.gameTable.creatorTwoSum = [sender.text intValue];
    [self.gameTable saveInBackground];
    [self fetchAndRefresh];
    if (sender.text.length > 0) {
        sender.enabled = NO;
    }
}
- (IBAction)inputThree:(UITextField*)sender {
    self.gameTable.creatorThreeSum = [sender.text intValue];
    [self.gameTable saveInBackground];
    [self fetchAndRefresh];
    if (sender.text.length > 0) {
        sender.enabled = NO;
    }
}
- (IBAction)inputFour:(UITextField*)sender {
    self.gameTable.creatorFourSum = [sender.text intValue];
    [self.gameTable saveInBackground];
    [self fetchAndRefresh];
    if (sender.text.length > 0) {
        sender.enabled = NO;
    }
}
- (IBAction)inputFive:(UITextField*)sender {
    self.gameTable.creatorFiveSum = [sender.text intValue];
    [self.gameTable saveInBackground];
    [self fetchAndRefresh];
    if (sender.text.length > 0) {
        sender.enabled = NO;
    }
}
- (IBAction)inputSix:(UITextField*)sender {
    self.gameTable.creatorSixSum = [sender.text intValue];
    [self.gameTable saveInBackground];
    [self fetchAndRefresh];
    if (sender.text.length > 0) {
        sender.enabled = NO;
    }
}
- (IBAction)inputPair:(UITextField*)sender {
    self.gameTable.creatorPairSum = [sender.text intValue];
    [self.gameTable saveInBackground];
    [self fetchAndRefresh];
    if (sender.text.length > 0) {
        sender.enabled = NO;
    }
}
- (IBAction)inputThreeSame:(UITextField*)sender {
    self.gameTable.creatorThreeEqualSum = [sender.text intValue];
    [self.gameTable saveInBackground];
    [self fetchAndRefresh];
    if (sender.text.length > 0) {
        sender.enabled = NO;
    }
}
- (IBAction)fourSame:(UITextField*)sender {
    self.gameTable.creatorSquareSum = [sender.text intValue];
    [self.gameTable saveInBackground];
    [self fetchAndRefresh];
    if (sender.text.length > 0) {
        sender.enabled = NO;
    }
}
- (IBAction)inputSmall:(UITextField*)sender {
    self.gameTable.creatorSmallSum = [sender.text intValue];
    [self.gameTable saveInBackground];
    [self fetchAndRefresh];
    if (sender.text.length > 0) {
        sender.enabled = NO;
    }
}
- (IBAction)inputBig:(UITextField*)sender {
    self.gameTable.creatorBigSum = [sender.text intValue];
    [self.gameTable saveInBackground];
    [self fetchAndRefresh];
    if (sender.text.length > 0) {
        sender.enabled = NO;
    }
}
- (IBAction)inputFull:(UITextField*)sender {
    self.gameTable.creatorFullSum = [sender.text intValue];
    [self.gameTable saveInBackground];
    [self fetchAndRefresh];
    if (sender.text.length > 0) {
        sender.enabled = NO;
    }
}
- (IBAction)inputGeneral:(UITextField*)sender {
    self.gameTable.creatorGeneralSum = [sender.text intValue];
    [self.gameTable saveInBackground];
    [self fetchAndRefresh];
    if (sender.text.length > 0) {
        sender.enabled = NO;
    }
}
- (IBAction)inputChance:(UITextField*)sender {
    self.gameTable.creatorChanceSum = [sender.text intValue];
    [self.gameTable saveInBackground];
    [self fetchAndRefresh];
    if (sender.text.length > 0) {
        sender.enabled = NO;
    }
}

-(void)fetchAndRefresh{
    [self.gameTable fetchInBackgroundWithBlock:^(PFObject * _Nullable object, NSError * _Nullable error) {

        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.oponentOne.text = [NSString stringWithFormat: @"%ld", (long)self.gameTable.creatorOneSum];
            [self.oponentOne setNeedsDisplay];

        }];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.oponentTwoLable.text = [NSString stringWithFormat: @"%ld", (long)self.gameTable.creatorTwoSum];
            [self.oponentTwoLable setNeedsDisplay];
            
        }];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.oponentThree.text = [NSString stringWithFormat: @"%ld", (long)self.gameTable.creatorThreeSum];
            [self.oponentThree setNeedsDisplay];
            
        }];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.oponentFour.text = [NSString stringWithFormat: @"%ld", (long)self.gameTable.creatorFourSum];
            [self.oponentFour setNeedsDisplay];
            
        }];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.oponentFive.text = [NSString stringWithFormat: @"%ld", (long)self.gameTable.creatorFiveSum];
            [self.oponentFive setNeedsDisplay];
            
        }];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.oponentSix.text = [NSString stringWithFormat: @"%ld", (long)self.gameTable.creatorSixSum];
            [self.oponentSix setNeedsDisplay];
            
        }];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.oponentPair.text = [NSString stringWithFormat: @"%ld", (long)self.gameTable.creatorPairSum];
            [self.oponentPair setNeedsDisplay];
            
        }];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.oponentThreeSame.text = [NSString stringWithFormat: @"%ld", (long)self.gameTable.creatorThreeEqualSum];
            [self.oponentThreeSame setNeedsDisplay];
            
        }];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.oponentFourSame.text = [NSString stringWithFormat: @"%ld", (long)self.gameTable.creatorSquareSum];
            [self.oponentFourSame setNeedsDisplay];
            
        }];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.oponentSmall.text = [NSString stringWithFormat: @"%ld", (long)self.gameTable.creatorSmallSum];
            [self.oponentSmall setNeedsDisplay];
            
        }];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.oponentBig.text = [NSString stringWithFormat: @"%ld", (long)self.gameTable.creatorBigSum];
            [self.oponentBig setNeedsDisplay];
            
        }];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.oponentFull.text = [NSString stringWithFormat: @"%ld", (long)self.gameTable.creatorFullSum];
            [self.oponentFull setNeedsDisplay];
            
        }];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.oponentGeneral.text = [NSString stringWithFormat: @"%ld", (long)self.gameTable.creatorGeneralSum];
            [self.oponentGeneral setNeedsDisplay];
            
        }];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.oponentChance.text = [NSString stringWithFormat: @"%ld", (long)self.gameTable.creatorChanceSum];
            [self.oponentChance setNeedsDisplay];
            
        }];
    }];
    
}

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

@end
