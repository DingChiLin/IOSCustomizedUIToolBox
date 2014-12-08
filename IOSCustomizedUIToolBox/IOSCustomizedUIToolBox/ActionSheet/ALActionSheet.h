//
//  E8DPokeActionSheet.h
//  CustomerActionSheetTest
//
//  Created by Arthur Lin on 2014/4/23.
//  Copyright (c) 2014年 Arthur Lin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ALActionSheet;

@protocol ALActionSheetDelegate <NSObject>

@optional

- (void)aLActionSheet:(ALActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex;

@end

@interface ALActionSheet : UIView

- (id)initWithTitle:(NSString *)title delegate:(id<ALActionSheetDelegate>)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...;

- (void)showInView:(UIView *)view;

@property(nonatomic,assign) id<ALActionSheetDelegate> delegate;

@end
