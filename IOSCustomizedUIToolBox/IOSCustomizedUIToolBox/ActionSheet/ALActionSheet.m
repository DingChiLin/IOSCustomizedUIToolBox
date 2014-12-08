//
//  E8DPokeActionSheet.m
//  CustomerActionSheetTest
//
//  Created by Arthur Lin on 2014/4/23.
//  Copyright (c) 2014年 Arthur Lin. All rights reserved.
//

#import "ALActionSheet.h"

@interface ALActionSheet()

@property(nonatomic,retain) NSString *title;
@property(nonatomic,retain) NSString *cancelTitle;
@property(nonatomic,retain) NSArray *otherTitles;

@property(nonatomic,retain) UIView *backgroundView;
@property(nonatomic,retain) UIView *coverView;
@property(nonatomic,retain) UIImageView *buttonBgImageView;

@property(nonatomic) int buttonBgHeight;

@end

@implementation ALActionSheet

- (void)dealloc{
    
    self.title = nil;
    self.cancelTitle = nil;
    self.otherTitles = nil;
    
    self.backgroundView = nil;
    self.coverView = nil;
    self.buttonBgImageView = nil;
    
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        

    }
    return self;
}

- (id)initWithTitle:(NSString *)title delegate:(id<ALActionSheetDelegate>)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...{
    
    self = [super init];
    if (self) {
        
        NSMutableArray *arguments=[[NSMutableArray alloc]initWithArray:nil];
        id eachObject;
        va_list argumentList;
        if (otherButtonTitles)
        {
            [arguments addObject: otherButtonTitles];
            va_start(argumentList, otherButtonTitles);
            while ((eachObject = va_arg(argumentList, id)))
            {
                [arguments addObject: eachObject];
            }
            va_end(argumentList);
        }
        
        self.title = title;
        self.delegate = delegate;
        self.cancelTitle = cancelButtonTitle;
        self.otherTitles = arguments;
        
        self.buttonBgHeight = 100 + 60 + (int)[arguments count]*65;
        
        [arguments release];
        
        [self setLayout];
    }
    return self;
    
}

- (void)setLayout{
    
    [super layoutSubviews];
    
    self.backgroundColor = [UIColor clearColor];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    //背景透明圖 (阻擋parent view按鈕響應)
    self.backgroundView = [[UIView new]autorelease];
    self.backgroundView.backgroundColor = [UIColor clearColor];
    self.backgroundView.frame = CGRectMake(0, 0, screenWidth,screenHeight);
    self.backgroundView.userInteractionEnabled = YES;
    self.backgroundView.exclusiveTouch = YES;
    [self addSubview:self.backgroundView];
    
    //背景半透明黑圖
    self.coverView = [[UIView new]autorelease];
    self.coverView.backgroundColor = [UIColor blackColor];
    self.coverView.alpha = 0.3;
    self.coverView.frame = CGRectMake(0, 0, screenWidth,screenHeight);
    [self.backgroundView addSubview:self.coverView];
    
    //按鈕底圖
    self.buttonBgImageView = [[UIImageView new]autorelease];
    self.buttonBgImageView.frame = CGRectMake(0, screenHeight, screenWidth, self.buttonBgHeight);
    self.buttonBgImageView.userInteractionEnabled = YES;
    self.buttonBgImageView.image = [UIImage imageNamed:@"actsheet_board_01"];
    [self.backgroundView addSubview:self.buttonBgImageView];
    
    //標題
    UILabel *titleLabel = [UILabel new];
    titleLabel.frame = CGRectMake(10,20,screenWidth-20,40);
    titleLabel.text = self.title;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor = [UIColor grayColor];
    [self.buttonBgImageView addSubview:titleLabel];
    [titleLabel release];

    UIImage *ccbImage;
    UIImage *ccbPressImage;
    
    if ([UIImage instancesRespondToSelector:@selector(resizableImageWithCapInsets:)]) {
        ccbImage = [[UIImage imageNamed:@"button_01"] resizableImageWithCapInsets:UIEdgeInsetsMake(10,10,50,10)];
        ccbPressImage = [[UIImage imageNamed:@"button_01_press"] resizableImageWithCapInsets:UIEdgeInsetsMake(10,10,10,10)];
    }else{
        ccbImage = [[UIImage imageNamed:@"button_01"] stretchableImageWithLeftCapWidth:18.0f topCapHeight:18.0f];
        ccbPressImage = [[UIImage imageNamed:@"button_01_press"] stretchableImageWithLeftCapWidth:18.0f topCapHeight:18.0f];
    }
    
    int i = (int)[self.otherTitles count];
    
    for(NSString *buttonTitle in self.otherTitles){
        
        UIButton *otherBbutton = [UIButton new];
        otherBbutton.frame = CGRectMake(20, self.buttonBgImageView.bounds.size.height-80-10-65*i, 280, 60);
        [otherBbutton setTitle:buttonTitle forState:UIControlStateNormal];
        [otherBbutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [otherBbutton setBackgroundImage:ccbImage forState:UIControlStateNormal];
        [otherBbutton setBackgroundImage:ccbPressImage forState:UIControlStateHighlighted];
        [otherBbutton addTarget:self action:@selector(otherBbuttonClick:) forControlEvents:
         UIControlEventTouchUpInside];
        otherBbutton.tag = [self.otherTitles count]-i;
        [self.buttonBgImageView addSubview:otherBbutton];
        [otherBbutton release];
        
        i--;
    }
    
    
    //最下方
    UIButton *cancelBbutton = [UIButton new];
    cancelBbutton.frame = CGRectMake(20, self.buttonBgImageView.bounds.size.height-80, 280, 60);
    [cancelBbutton setTitle:self.cancelTitle forState:UIControlStateNormal];
    [cancelBbutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cancelBbutton setBackgroundImage:ccbImage forState:UIControlStateNormal];
    [cancelBbutton setBackgroundImage:ccbPressImage forState:UIControlStateHighlighted];
    [cancelBbutton addTarget:self action:@selector(cancelButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonBgImageView addSubview:cancelBbutton];
    [cancelBbutton release];
    
}

- (void)showInView:(UIView *)view{
    
    [view addSubview:self];
    
    [self.superview resignFirstResponder];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;

    //讓View顯示在最上層
    NSArray *windows = [[UIApplication sharedApplication] windows];;
    [[windows lastObject] addSubview:self.backgroundView];
    
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         self.buttonBgImageView.frame = CGRectMake(0, screenHeight-self.buttonBgHeight, screenWidth, self.buttonBgHeight);
                     }
                     completion:^(BOOL finished){
                     }];

}

- (void)otherBbuttonClick:(id)sender{
    
    UIButton *button = (UIButton *)sender;
    
    if([self.delegate respondsToSelector:@selector(aLActionSheet:clickedButtonAtIndex:)]){
        [self.delegate aLActionSheet:self clickedButtonAtIndex:button.tag];
    }
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    [UIView animateWithDuration:0.3
                          delay:0.1
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         self.buttonBgImageView.frame = CGRectMake(0, screenHeight, screenWidth, self.buttonBgHeight);
                     }
                     completion:^(BOOL finished){
                         if (finished)
                             [self.backgroundView removeFromSuperview];
                     }];
    
}

- (void)cancelButtonClick:(id)sender{
        
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    [UIView animateWithDuration:0.3
                          delay:0.1
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         self.buttonBgImageView.frame = CGRectMake(0, screenHeight, screenWidth, self.buttonBgHeight);
                     }
                     completion:^(BOOL finished){
                         if (finished)
                             [self.backgroundView removeFromSuperview];
                     }];
    
    if([self.delegate respondsToSelector:@selector(aLActionSheet:clickedButtonAtIndex:)]){
        [self.delegate aLActionSheet:self clickedButtonAtIndex:[self.otherTitles count]];
    }
}


@end
