//
//  E8DPokeAlertView.h
//  SlideViewTest
//
//  Created by Arthur Lin on 2014/4/15.
//  Copyright (c) 2014年 Arthur Lin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ALAlertView;

@protocol ALAlertViewDelegate <NSObject>

@optional
- (void) aLAlertView:(ALAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;

@end

@interface ALAlertView : UIView

@property(nonatomic,retain)UILabel *alertView;

@property(nonatomic,retain)NSString *message;
@property(nonatomic,retain)NSString *title;

-(id)initWithTitle:(NSString*)title message:(NSString*)message delegate:(UIViewController *)delegate cancelButtonTitle:(NSString*)cancelTitle otherButtonTitles:(NSString*)otherTitles, ...;

-(id)initWithTitle:(NSString*)title image:(UIImage *)image message:(NSString*)message delegate:(UIViewController<ALAlertViewDelegate> *)delegate cancelButtonTitle:(NSString*)cancelTitle otherButtonTitles:(NSString*)otherTitles, ...;
    
-(void)show;
-(void)dismiss;

@property(nonatomic,assign) UIViewController<ALAlertViewDelegate> *delegate;

@end
