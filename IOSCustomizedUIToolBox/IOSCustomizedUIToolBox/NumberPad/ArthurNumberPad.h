//
//  ArthurNumberPad.h
//  CustomizeNumberPadDemo
//
//  Created by Arthur Lin on 2014/12/5.
//  Copyright (c) 2014年 Arthur Lin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ArthurNumberPad;

@protocol ArthurNumberPadDelegate <NSObject>

// Called when a button is clicked. The view will be automatically dismissed after this call returns
- (void)chooseNumber:(int)number;
- (void)deleteNumber;
- (void)cancelNumberPad;

@end

@interface ArthurNumberPad : UIView

//- (id)initWithTitle:(NSString *)title delegate:(id<E8DPokeActionSheetDelegate>)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...;

- (void)showInView:(UIView *)view;

@property(nonatomic,assign) id<ArthurNumberPadDelegate> delegate;

@end
