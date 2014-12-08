//
//  ArthurNumberPad.h
//  CustomizeNumberPadDemo
//
//  Created by Arthur Lin on 2014/12/5.
//  Copyright (c) 2014年 Arthur Lin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ALNumberPad;

@protocol ALNumberPadDelegate <NSObject>

- (void)alNumberPadChoose:(ALNumberPad *)numberPad withNumber:(int)number;
- (void)alNumberPadDeleteNumber:(ALNumberPad *)numberPad;
- (void)alNumberPadCancelPad:(ALNumberPad *)numberPad;

@end

@interface ALNumberPad : UIView

- (void)showInView:(UIView *)view;
- (void)resignFirstResponder;

@property(nonatomic,assign) id<ALNumberPadDelegate> delegate;
@property(nonatomic,assign) BOOL isShowCancelButton;

@end
