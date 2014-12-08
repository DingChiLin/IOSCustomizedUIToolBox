//
//  E8DPokeAlertView.m
//  SlideViewTest
//
//  Created by Arthur Lin on 2014/4/15.
//  Copyright (c) 2014年 Arthur Lin. All rights reserved.
//

#import "ALAlertView.h"
#import <QuartzCore/QuartzCore.h>
//#import "E8DACImageView.h"
//#import "E8DACUtility.h"

@interface ALAlertView()


@property(nonatomic,retain)NSString *cancelTitle;
@property(nonatomic,retain)NSArray *otherTitles;
@property(nonatomic,retain)UIImage *image;

@end

@implementation ALAlertView


-(void)dealloc{
    
    self.alertView = nil;
    self.message = nil;
    self.title = nil;
    self.cancelTitle = nil;
    self.otherTitles = nil;
    self.image = nil;
    
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.userInteractionEnabled = YES;
        
        [self setBackgroundVeiw];

    }
    return self;
}

-(id)initWithTitle:(NSString*)title message:(NSString*)message delegate:(UIViewController<ALAlertViewDelegate> *)delegate cancelButtonTitle:(NSString*)cancelTitle otherButtonTitles:(NSString*)otherTitles, ...{
    
    self = [super init];
    if (self) {

        self.userInteractionEnabled = YES;
        
        [self setBackgroundVeiw];
        
        NSMutableArray *arguments=[[NSMutableArray alloc]initWithArray:nil];
        id eachObject;
        va_list argumentList;
        if (otherTitles)
        {
            [arguments addObject: otherTitles];
            va_start(argumentList, otherTitles);
            while ((eachObject = va_arg(argumentList, id)))
            {
                [arguments addObject: eachObject];
            }
            va_end(argumentList);
        }
        
        self.image = nil;
        self.message = message;
        self.title = title;
        self.delegate = delegate;
        self.cancelTitle = cancelTitle;
        self.otherTitles = arguments;
        
        [arguments release];

    }
    return self;
}

-(id)initWithTitle:(NSString*)title image:(UIImage *)image message:(NSString*)message delegate:(UIViewController<ALAlertViewDelegate> *)delegate cancelButtonTitle:(NSString*)cancelTitle otherButtonTitles:(NSString*)otherTitles, ...{
    
    self = [super init];
    if (self) {
        
        self.userInteractionEnabled = YES;
        
        [self setBackgroundVeiw];
        
        NSMutableArray *arguments=[[NSMutableArray alloc]initWithArray:nil];
        id eachObject;
        va_list argumentList;
        if (otherTitles)
        {
            [arguments addObject: otherTitles];
            va_start(argumentList, otherTitles);
            while ((eachObject = va_arg(argumentList, id)))
            {
                [arguments addObject: eachObject];
            }
            va_end(argumentList);
        }
        
        self.image = image;
        self.message = message;
        self.title = title;
        self.delegate = delegate;
        self.cancelTitle = cancelTitle;
        self.otherTitles = arguments;
        
        [arguments release];
    }
    return self;
}

-(void)setBackgroundVeiw{
    NSArray *windows = [[UIApplication sharedApplication] windows];
    UIWindow *window = [windows lastObject];
    
    self.frame = window.frame;
    self.backgroundColor = [UIColor clearColor];
    
    //背景半透明黑色底圖
    UIView *bgView = [[UIView alloc]init];
    bgView.frame = window.frame;
    bgView.backgroundColor = [UIColor blackColor];
    bgView.alpha = 0.2;
    bgView.userInteractionEnabled = YES;
    [self addSubview:bgView];
    [bgView release];
    
    self.alertView = [[[UILabel alloc]init]autorelease];
    self.alertView.frame = CGRectMake(26, window.frame.size.height/2-90, 268, 180);
    [self addSubview:self.alertView];
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    NSArray *windows = [[UIApplication sharedApplication] windows];
    UIWindow *window = [windows lastObject];
    
    //內容白色底圖
    self.alertView.layer.borderWidth  = 0.0f;
    self.alertView.layer.cornerRadius = 10.0f;
    self.alertView.clipsToBounds = YES;
    self.alertView.backgroundColor = [UIColor whiteColor];
    self.alertView.userInteractionEnabled = YES;
    
    UILabel *titlelabel = [[UILabel alloc]init];
    titlelabel.frame = CGRectMake(24,30,220,21);
    titlelabel.textColor = [UIColor blackColor];
    titlelabel.font = [UIFont systemFontOfSize:22];
    titlelabel.numberOfLines = 5;
    titlelabel.lineBreakMode = NSLineBreakByCharWrapping;
    titlelabel.textAlignment = NSTextAlignmentCenter;
    titlelabel.text = self.title;
    [self.alertView addSubview:titlelabel];
    [titlelabel release];
    
    UILabel *messagelabel = [[UILabel alloc]init];
    messagelabel.frame = CGRectMake(24,52,220,60);
    messagelabel.textColor = [UIColor blackColor];
    messagelabel.lineBreakMode = NSLineBreakByCharWrapping;
    messagelabel.numberOfLines = 5;
    messagelabel.font = [UIFont systemFontOfSize:14];
    messagelabel.textAlignment = NSTextAlignmentCenter;
    messagelabel.text = self.message;
    [self.alertView addSubview:messagelabel];
    [messagelabel release];
    
    if(self.message == nil || [self.message isEqualToString:@""]){
        [messagelabel setHidden:YES];
    }
    
    if(self.image != nil){
  
        UIImageView *imageView = [UIImageView new];
        imageView.frame = CGRectMake(30,30,80,70);
        imageView.image = self.image;
        [self.alertView addSubview:imageView];
        [imageView release];
        
        titlelabel.frame = CGRectMake(120,30,120,40);
        messagelabel.frame = CGRectMake(120,50,120,60);
    }
    
    if(self.cancelTitle == nil && [self.otherTitles count] == 0){ //無按鈕
    
        self.alertView.frame = CGRectMake(26, window.frame.size.height/2-90, 268, 100);
    
    } else if([self.otherTitles count] == 0){ //一個按鈕
        UIButton *button = [[UIButton alloc]init];
        button.frame = CGRectMake(24, 115, 220, 50);
        [button setTitle:self.cancelTitle forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setBackgroundImage:[[UIImage imageNamed:@"actsheet_button_01"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)] forState:UIControlStateNormal];
        [button setBackgroundImage:[[UIImage imageNamed:@"actsheet_button_01_press"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)] forState:UIControlStateHighlighted];
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        [button addTarget:self action:@selector(cencelButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.alertView addSubview:button];
        [button release];
    }
    
    //兩個以上按鈕 （先都只放兩個）
    if([self.otherTitles count]>0){
        
        UIButton *button1 = [[UIButton alloc]init];
        button1.frame = CGRectMake(8, 120, 122, 40);
        [button1 setTitle:self.cancelTitle forState:UIControlStateNormal];
        [button1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button1 setBackgroundImage:[[UIImage imageNamed:@"button_01"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)] forState:UIControlStateNormal];
        [button1 setBackgroundImage:[[UIImage imageNamed:@"button_01_press"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)] forState:UIControlStateHighlighted];
        button1.titleLabel.font = [UIFont systemFontOfSize:16];

        [button1 addTarget:self action:@selector(cencelButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.alertView addSubview:button1];
        [button1 release];
        
        
        UIButton *button2 = [[UIButton alloc]init];
        button2.frame = CGRectMake(138, 120, 122, 40);
        [button2 setTitle:[self.otherTitles objectAtIndex:0] forState:UIControlStateNormal];
        [button2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button2 setBackgroundImage:[[UIImage imageNamed:@"button_01"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)] forState:UIControlStateNormal];
        [button2 setBackgroundImage:[[UIImage imageNamed:@"button_01_press"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)] forState:UIControlStateHighlighted];
        button2.titleLabel.font = [UIFont systemFontOfSize:16];

        [button2 addTarget:self action:@selector(sureButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.alertView addSubview:button2];
        [button2 release];
    }
    
    //三個以上按鈕，目前沒有實作這樣的畫面
    if([self.otherTitles count]>2){
        NSLog(@"尚未處理超過兩個按鈕的畫面！！");
    }
}

- (void)cencelButtonClick:(id)sender{

    
    if( [self.delegate respondsToSelector:@selector(aLAlertView:clickedButtonAtIndex:)] ){
        [self.delegate aLAlertView:self clickedButtonAtIndex:0];
    }
    [self removeFromSuperview];

}

- (void)sureButtonClick:(id)sender{
    
    
    if( [self.delegate respondsToSelector:@selector(aLAlertView:clickedButtonAtIndex:)] ){
        [self.delegate aLAlertView:self clickedButtonAtIndex:1];
    }
    [self removeFromSuperview];

}

- (void)dismiss{
    [self removeFromSuperview];
}

-(void)show{
    
    NSArray *windows = [UIApplication sharedApplication].windows;
    [[windows lastObject] addSubview:self];
    
}

@end
