//
//  HowToPlayViewController.m
//  IvoryGame
//
//  Created by Miroslav Ivanov on 2/3/16.
//  Copyright © 2016 Miroslav Ivanov. All rights reserved.
//

#import "HowToPlayViewController.h"

@interface HowToPlayViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textViewHowTo;
@end

@implementation HowToPlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *backgroundImage = [UIImage imageNamed:@"camouflage"];
    UIImageView *backgroundImageView=[[UIImageView alloc]initWithFrame:self.view.frame];
    backgroundImageView.image=backgroundImage;
    [self.view insertSubview:backgroundImageView atIndex:0];
    
    NSMutableString *str = [NSMutableString string];
    [str appendString:@"The goal of the game is to get maximum points out of a game vs. oponent.\n"];
    [str appendString:@"In the game you must make certain combinations out of 5 dices:\n"];
    [str appendString:@"   - the numbers from 1 to 6\n"];
    [str appendString:@"   - pair (the sum of two dices of same number)\n"];
    [str appendString:@"   - three same dices (the sum of three dices of same number)\n"];
    [str appendString:@"   - four same dices (the sum of four dices of same number)\n"];
    [str appendString:@"   - the numbers from 1 to 5 (sum is 15)\n"];
    [str appendString:@"   - the numbers from 2 to 6 (sum is 20)\n"];
    [str appendString:@"   - 'Full House' three same dices + two same dices\n"];
    [str appendString:@"   - GENERAL (five same dices)\n"];
    [str appendString:@"   - 'Chance' (the sum of the five random dices)\n"];
    [str appendString:@"On each turn you have three throws to achiev any of the combinations.\n"];
    [str appendString:@"Each combination can be made only once.\n"];
    [str appendString:@"The player with more final points win!\n"];

    [self.textViewHowTo setUserInteractionEnabled:YES];
    //[self.textViewHowTo backgroundColor:[UIColor whiteColor]];
    [self.textViewHowTo setBackgroundColor:[UIColor colorWithRed:1.00 green:1.00 blue:1.00 alpha:0.9]];
    self.textViewHowTo.text = str;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end



