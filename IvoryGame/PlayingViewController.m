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

@property UIImage *oneDotImage;
@property UIImage *twoDotImage;
@property UIImage *threeDotImage;
@property UIImage *fourDotImage;
@property UIImage *fiveDotImage;
@property UIImage *sixDotImage;

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
    
    self.oneDotImage = [UIImage imageNamed:@"one-dot"];
    self.twoDotImage = [UIImage imageNamed:@"two-dot"];
    self.threeDotImage = [UIImage imageNamed:@"three-dot"];
    self.fourDotImage = [UIImage imageNamed:@"four-dot"];
    self.fiveDotImage = [UIImage imageNamed:@"five-dot"];
    self.sixDotImage = [UIImage imageNamed:@"six-dot"];
    
    [self.btnDiceOne setTitle:@"" forState:UIControlStateNormal];
    [self.btnDiceTwo setTitle:@"" forState:UIControlStateNormal];
    [self.btnDiceThree setTitle:@"" forState:UIControlStateNormal];
    [self.btnDiceFour setTitle:@"" forState:UIControlStateNormal];
    [self.btnDiceFive setTitle:@"" forState:UIControlStateNormal];
    
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
            switch (num) {
                case 1: [self.btnDiceOne setBackgroundImage:self.oneDotImage forState:UIControlStateNormal]; break;
                case 2: [self.btnDiceOne setBackgroundImage:self.twoDotImage forState:UIControlStateNormal]; break;
                case 3: [self.btnDiceOne setBackgroundImage:self.threeDotImage forState:UIControlStateNormal]; break;
                case 4: [self.btnDiceOne setBackgroundImage:self.fourDotImage forState:UIControlStateNormal]; break;
                case 5: [self.btnDiceOne setBackgroundImage:self.fiveDotImage forState:UIControlStateNormal]; break;
                case 6: [self.btnDiceOne setBackgroundImage:self.sixDotImage forState:UIControlStateNormal]; break;
            }
            
        }
        if (self.diceTwoIsAvailable) {
            NSInteger num = [self randomNumberBetween:1 maxNumber:6];
            switch (num) {
                case 1: [self.btnDiceTwo setBackgroundImage:self.oneDotImage forState:UIControlStateNormal]; break;
                case 2: [self.btnDiceTwo setBackgroundImage:self.twoDotImage forState:UIControlStateNormal]; break;
                case 3: [self.btnDiceTwo setBackgroundImage:self.threeDotImage forState:UIControlStateNormal]; break;
                case 4: [self.btnDiceTwo setBackgroundImage:self.fourDotImage forState:UIControlStateNormal]; break;
                case 5: [self.btnDiceTwo setBackgroundImage:self.fiveDotImage forState:UIControlStateNormal]; break;
                case 6: [self.btnDiceTwo setBackgroundImage:self.sixDotImage forState:UIControlStateNormal]; break;
            }
        }
        if (self.diceThreeIsAvailable) {
            NSInteger num = [self randomNumberBetween:1 maxNumber:6];
            switch (num) {
                case 1: [self.btnDiceThree setBackgroundImage:self.oneDotImage forState:UIControlStateNormal]; break;
                case 2: [self.btnDiceThree setBackgroundImage:self.twoDotImage forState:UIControlStateNormal]; break;
                case 3: [self.btnDiceThree setBackgroundImage:self.threeDotImage forState:UIControlStateNormal]; break;
                case 4: [self.btnDiceThree setBackgroundImage:self.fourDotImage forState:UIControlStateNormal]; break;
                case 5: [self.btnDiceThree setBackgroundImage:self.fiveDotImage forState:UIControlStateNormal]; break;
                case 6: [self.btnDiceThree setBackgroundImage:self.sixDotImage forState:UIControlStateNormal]; break;
            }
        }
        if (self.diceFourIsAvailable) {
            NSInteger num = [self randomNumberBetween:1 maxNumber:6];
            switch (num) {
                case 1: [self.btnDiceFour setBackgroundImage:self.oneDotImage forState:UIControlStateNormal]; break;
                case 2: [self.btnDiceFour setBackgroundImage:self.twoDotImage forState:UIControlStateNormal]; break;
                case 3: [self.btnDiceFour setBackgroundImage:self.threeDotImage forState:UIControlStateNormal]; break;
                case 4: [self.btnDiceFour setBackgroundImage:self.fourDotImage forState:UIControlStateNormal]; break;
                case 5: [self.btnDiceFour setBackgroundImage:self.fiveDotImage forState:UIControlStateNormal]; break;
                case 6: [self.btnDiceFour setBackgroundImage:self.sixDotImage forState:UIControlStateNormal]; break;
            }
        }
        if (self.diceFiveIsAvailable) {
            NSInteger num = [self randomNumberBetween:1 maxNumber:6];
            switch (num) {
                case 1: [self.btnDiceFive setBackgroundImage:self.oneDotImage forState:UIControlStateNormal]; break;
                case 2: [self.btnDiceFive setBackgroundImage:self.twoDotImage forState:UIControlStateNormal]; break;
                case 3: [self.btnDiceFive setBackgroundImage:self.threeDotImage forState:UIControlStateNormal]; break;
                case 4: [self.btnDiceFive setBackgroundImage:self.fourDotImage forState:UIControlStateNormal]; break;
                case 5: [self.btnDiceFive setBackgroundImage:self.fiveDotImage forState:UIControlStateNormal]; break;
                case 6: [self.btnDiceFive setBackgroundImage:self.sixDotImage forState:UIControlStateNormal]; break;
            }
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ( [[segue identifier] isEqualToString:@"playingToScoresSegue"] & [segue.destinationViewController respondsToSelector:@selector(setScoresArray:)]) {
        NSInteger selfScore = self.gameTable.creatorOneSum +
        self.gameTable.creatorTwoSum +
        self.gameTable.creatorThreeSum +
        self.gameTable.creatorFourSum +
        self.gameTable.creatorFiveSum +
        self.gameTable.creatorSixSum +
        self.gameTable.creatorPairSum +
        self.gameTable.creatorThreeEqualSum +
        self.gameTable.creatorSquareSum +
        self.gameTable.creatorSmallSum +
        self.gameTable.creatorBigSum +
        self.gameTable.creatorFullSum +
        self.gameTable.creatorGeneralSum +
        self.gameTable.creatorChanceSum;
        
        NSInteger oponentScore = self.gameTable.joinOneSum +
        self.gameTable.joinTwoSum +
        self.gameTable.joinThreeSum +
        self.gameTable.joinFourSum +
        self.gameTable.joinFiveSum +
        self.gameTable.joinSixSum +
        self.gameTable.joinPairSum +
        self.gameTable.joinThreeEqualSum +
        self.gameTable.joinSquareSum +
        self.gameTable.joinSmallSum +
        self.gameTable.joinBigSum +
        self.gameTable.joinFullSum +
        self.gameTable.joinGeneralSum +
        self.gameTable.joinChanceSum;
        
        
        NSArray *arr = [NSArray arrayWithObjects:[NSNumber numberWithInteger:selfScore], [NSNumber numberWithInteger:oponentScore], nil];

        [segue.destinationViewController performSelector:@selector(setScoresArray:)
                                              withObject:arr];
    }
}


@end
