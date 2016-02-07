//
//  PlayingViewController.m
//  IvoryGame
//
//  Created by Miroslav Ivanov on 2/7/16.
//  Copyright © 2016 Miroslav Ivanov. All rights reserved.
//

#import "PlayingViewController.h"
#import "ToastView.h"
#import <AudioToolbox/AudioServices.h>
#import "AppDelegate.h"

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

@property BOOL diceOneIsAvailable;
@property BOOL diceTwoIsAvailable;
@property BOOL diceThreeIsAvailable;
@property BOOL diceFourIsAvailable;
@property BOOL diceFiveIsAvailable;
@property NSInteger shufflesCount;

@property (weak, nonatomic) IBOutlet UIButton *btnDiceOne;
@property (weak, nonatomic) IBOutlet UIButton *btnDiceTwo;
@property (weak, nonatomic) IBOutlet UIButton *btnDiceThree;
@property (weak, nonatomic) IBOutlet UIButton *btnDiceFour;
@property (weak, nonatomic) IBOutlet UIButton *btnDiceFive;

@property NSInteger isFinished;
@end

@implementation PlayingViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *backgroundImage = [UIImage imageNamed:@"camouflage.png"];
    UIImageView *backgroundImageView=[[UIImageView alloc]initWithFrame:self.view.frame];
    backgroundImageView.image=backgroundImage;
    [self.view insertSubview:backgroundImageView atIndex:0];
    
    self.diceOneIsAvailable = YES;
    self.diceTwoIsAvailable = YES;
    self.diceThreeIsAvailable = YES;
    self.diceFourIsAvailable = YES;
    self.diceFiveIsAvailable = YES;
    
    self.isFinished = 0;
    
    self.shufflesCount = 0;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}




- (IBAction)inputOne:(UITextField*)sender {
    self.gameTable.creatorOneSum = [sender.text intValue];
    [self.gameTable saveInBackground];
    [self fetchAndRefresh];
    if (sender.text.length > 0) {
        sender.enabled = NO;
        self.shufflesCount = 0;
        self.isFinished++;
        [self resetDices];
    }

}
- (IBAction)inputTwo:(UITextField*)sender {
    self.gameTable.creatorTwoSum = [sender.text intValue];
    [self.gameTable saveInBackground];
    [self fetchAndRefresh];
    if (sender.text.length > 0) {
        sender.enabled = NO;
        self.shufflesCount = 0;
        self.isFinished++;
        [self resetDices];
    }
}
- (IBAction)inputThree:(UITextField*)sender {
    self.gameTable.creatorThreeSum = [sender.text intValue];
    [self.gameTable saveInBackground];
    [self fetchAndRefresh];
    if (sender.text.length > 0) {
        sender.enabled = NO;
        self.shufflesCount = 0;
        self.isFinished++;
        [self resetDices];
    }
}
- (IBAction)inputFour:(UITextField*)sender {
    self.gameTable.creatorFourSum = [sender.text intValue];
    [self.gameTable saveInBackground];
    [self fetchAndRefresh];
    if (sender.text.length > 0) {
        sender.enabled = NO;
        self.shufflesCount = 0;
        self.isFinished++;
        [self resetDices];
    }
}
- (IBAction)inputFive:(UITextField*)sender {
    self.gameTable.creatorFiveSum = [sender.text intValue];
    [self.gameTable saveInBackground];
    [self fetchAndRefresh];
    if (sender.text.length > 0) {
        sender.enabled = NO;
        self.shufflesCount = 0;
        self.isFinished++;
        [self resetDices];
    }
}
- (IBAction)inputSix:(UITextField*)sender {
    self.gameTable.creatorSixSum = [sender.text intValue];
    [self.gameTable saveInBackground];
    [self fetchAndRefresh];
    if (sender.text.length > 0) {
        sender.enabled = NO;
        self.shufflesCount = 0;
        self.isFinished++;
        [self resetDices];
    }
}
- (IBAction)inputPair:(UITextField*)sender {
    self.gameTable.creatorPairSum = [sender.text intValue];
    [self.gameTable saveInBackground];
    [self fetchAndRefresh];
    if (sender.text.length > 0) {
        sender.enabled = NO;
        self.shufflesCount = 0;
        self.isFinished++;
        [self resetDices];
    }
}
- (IBAction)inputThreeSame:(UITextField*)sender {
    self.gameTable.creatorThreeEqualSum = [sender.text intValue];
    [self.gameTable saveInBackground];
    [self fetchAndRefresh];
    if (sender.text.length > 0) {
        sender.enabled = NO;
        self.shufflesCount = 0;
        self.isFinished++;
        [self resetDices];
    }
}
- (IBAction)fourSame:(UITextField*)sender {
    self.gameTable.creatorSquareSum = [sender.text intValue];
    [self.gameTable saveInBackground];
    [self fetchAndRefresh];
    if (sender.text.length > 0) {
        sender.enabled = NO;
        self.shufflesCount = 0;
        self.isFinished++;
        [self resetDices];
    }
}
- (IBAction)inputSmall:(UITextField*)sender {
    self.gameTable.creatorSmallSum = [sender.text intValue];
    [self.gameTable saveInBackground];
    [self fetchAndRefresh];
    if (sender.text.length > 0) {
        sender.enabled = NO;
        self.shufflesCount = 0;
        self.isFinished++;
        [self resetDices];
    }
}
- (IBAction)inputBig:(UITextField*)sender {
    self.gameTable.creatorBigSum = [sender.text intValue];
    [self.gameTable saveInBackground];
    [self fetchAndRefresh];
    if (sender.text.length > 0) {
        sender.enabled = NO;
        self.shufflesCount = 0;
        self.isFinished++;
        [self resetDices];
    }
}
- (IBAction)inputFull:(UITextField*)sender {
    self.gameTable.creatorFullSum = [sender.text intValue];
    [self.gameTable saveInBackground];
    [self fetchAndRefresh];
    if (sender.text.length > 0) {
        sender.enabled = NO;
        self.shufflesCount = 0;
        self.isFinished++;
        [self resetDices];
    }
}
- (IBAction)inputGeneral:(UITextField*)sender {
    self.gameTable.creatorGeneralSum = [sender.text intValue];
    [self.gameTable saveInBackground];
    [self fetchAndRefresh];
    if (sender.text.length > 0) {
        sender.enabled = NO;
        self.shufflesCount = 0;
        self.isFinished++;
        [self resetDices];
    }
}
- (IBAction)inputChance:(UITextField*)sender {
    self.gameTable.creatorChanceSum = [sender.text intValue];
    [self.gameTable saveInBackground];
    [self fetchAndRefresh];
    if (sender.text.length > 0) {
        sender.enabled = NO;
        self.shufflesCount = 0;
        self.isFinished++;
        [self resetDices];
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
        //check if finished
        if (self.isFinished > 12) {
            [self performSegueWithIdentifier:@"playingToScoresSegue" sender:self];

        }
    }];
    
}

- (IBAction)shuffle:(id)sender {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];

    //    UIImage *newImage = [image stretchableImageWithLeftCapWidth:12.0 topCapHeight:0.0];
    //    [button setBackgroundImage:newImage forState:UIControlStateNormal]
    if (self.shufflesCount < 4) {
        
        if (appDelegate.isVibrationOn) {
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        }
        
        if (appDelegate.isSoundOn) {
        //play sound
        }

        if (self.diceOneIsAvailable) {
            NSInteger num = [self randomNumberBetween:1 maxNumber:6];
            [self.btnDiceOne setTitle:[NSString stringWithFormat:@"%ld", num] forState:UIControlStateNormal];
        }
        if (self.diceTwoIsAvailable) {
            NSInteger num = [self randomNumberBetween:1 maxNumber:6];
            [self.btnDiceTwo setTitle:[NSString stringWithFormat:@"%ld", num] forState:UIControlStateNormal];
        }
        if (self.diceThreeIsAvailable) {
            NSInteger num = [self randomNumberBetween:1 maxNumber:6];
            [self.btnDiceThree setTitle:[NSString stringWithFormat:@"%ld", num] forState:UIControlStateNormal];
        }
        if (self.diceFourIsAvailable) {
            NSInteger num = [self randomNumberBetween:1 maxNumber:6];
            [self.btnDiceFour setTitle:[NSString stringWithFormat:@"%ld", num] forState:UIControlStateNormal];
        }
        if (self.diceFiveIsAvailable) {
            NSInteger num = [self randomNumberBetween:1 maxNumber:6];
            [self.btnDiceFive setTitle:[NSString stringWithFormat:@"%ld", num] forState:UIControlStateNormal];
        }
        self.shufflesCount++;
    }else{
        [ToastView showToastInParentView:self.view withText:@"Three throws per turn!" withDuaration:3.0];
        
    }
}

- (IBAction)dice1:(UIButton*)sender {
    self.diceOneIsAvailable = !self.diceOneIsAvailable;
    if (self.btnDiceOne.backgroundColor == [UIColor redColor]) {
        [self.btnDiceOne setBackgroundColor: [UIColor lightGrayColor]];
    }
    else{
        [self.btnDiceOne setBackgroundColor: [UIColor redColor]];
    }
}
- (IBAction)dice2:(UIButton*)sender {
    self.diceTwoIsAvailable = !self.diceTwoIsAvailable;
    if (self.btnDiceTwo.backgroundColor == [UIColor redColor]) {
        [self.btnDiceTwo setBackgroundColor: [UIColor lightGrayColor]];
    }
    else{
        [self.btnDiceTwo setBackgroundColor: [UIColor redColor]];
    }
}
- (IBAction)dice3:(UIButton*)sender {
    self.diceThreeIsAvailable = !self.diceThreeIsAvailable;
    if (self.btnDiceThree.backgroundColor == [UIColor redColor]) {
        [self.btnDiceThree setBackgroundColor: [UIColor lightGrayColor]];
    }
    else{
        [self.btnDiceThree setBackgroundColor: [UIColor redColor]];
    }
}
- (IBAction)dice4:(UIButton*)sender {
    self.diceFourIsAvailable = !self.diceFourIsAvailable;
    if (self.btnDiceFour.backgroundColor == [UIColor redColor]) {
        [self.btnDiceFour setBackgroundColor: [UIColor lightGrayColor]];
    }
    else{
        [self.btnDiceFour setBackgroundColor: [UIColor redColor]];
    }
}
- (IBAction)dice5:(UIButton*)sender {
    self.diceFiveIsAvailable = !self.diceFiveIsAvailable;
    if (self.btnDiceFive.backgroundColor == [UIColor redColor]) {
        [self.btnDiceFive setBackgroundColor: [UIColor lightGrayColor]];
    }
    else{
        [self.btnDiceFive setBackgroundColor: [UIColor redColor]];
    }
}

- (NSInteger)randomNumberBetween:(NSInteger)min maxNumber:(NSInteger)max
{
    return min + arc4random_uniform(max - min + 1);
}

-(void)resetDices{
    [self.btnDiceOne setBackgroundColor: [UIColor lightGrayColor]];
    [self.btnDiceTwo setBackgroundColor: [UIColor lightGrayColor]];
    [self.btnDiceThree setBackgroundColor: [UIColor lightGrayColor]];
    [self.btnDiceFour setBackgroundColor: [UIColor lightGrayColor]];
    [self.btnDiceFive setBackgroundColor: [UIColor lightGrayColor]];

    self.diceOneIsAvailable = YES;
    self.diceTwoIsAvailable = YES;
    self.diceThreeIsAvailable = YES;
    self.diceFourIsAvailable = YES;
    self.diceFiveIsAvailable = YES;
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake)
    {
        [self shuffle:nil];
    } 
}

@end
