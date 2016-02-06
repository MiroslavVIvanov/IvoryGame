//
//  JoinGameViewController.m
//  IvoryGame
//
//  Created by Miroslav Ivanov on 2/3/16.
//  Copyright © 2016 Miroslav Ivanov. All rights reserved.
//

#import "JoinGameViewController.h"
#import "ToastView.h"

@interface JoinGameViewController ()

@end

@implementation JoinGameViewController
- (IBAction)test:(id)sender {
    [ToastView showToastInParentView:self.view withText:@"Test" withDuaration:5.0f];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
