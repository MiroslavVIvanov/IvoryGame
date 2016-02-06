//
//  ToastView.h
//  IvoryGame
//
//  Created by Miroslav Ivanov on 2/6/16.
//  Copyright © 2016 Miroslav Ivanov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToastView : UIView

@property (strong, nonatomic) NSString *text;

+ (void)showToastInParentView: (UIView *)parentView withText:(NSString *)text withDuaration:(float)duration;

@end
