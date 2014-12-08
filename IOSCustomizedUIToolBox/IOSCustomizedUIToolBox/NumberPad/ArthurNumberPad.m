//
//  E8DPokeActionSheet.m
//  CustomerActionSheetTest
//
//  Created by Arthur Lin on 2014/4/23.
//  Copyright (c) 2014年 Arthur Lin. All rights reserved.
//

#import "ArthurNumberPad.h"

@interface ArthurNumberPad(){
    float numberButtonWidth;
    float numberButtonHeight;
}

//@property(nonatomic,retain) NSString *title;
//@property(nonatomic,retain) NSString *cancelTitle;
//@property(nonatomic,retain) NSArray *otherTitles;

@property(nonatomic,retain) UIView *backgroundView;
//@property(nonatomic,retain) UIView *coverView;
@property(nonatomic,retain) UIImageView *buttonBgImageView;

@property(nonatomic) int buttonBgHeight;

@end

@implementation ArthurNumberPad

- (void)dealloc{
    
//    self.title = nil;
//    self.cancelTitle = nil;
//    self.otherTitles = nil;
    
    self.backgroundView = nil;
//    self.coverView = nil;
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

//- (id)initWithTitle:(NSString *)title delegate:(id<E8DPokeActionSheetDelegate>)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...{
//    
//    self = [super init];
//    if (self) {
//        
//        NSMutableArray *arguments=[[NSMutableArray alloc]initWithArray:nil];
//        id eachObject;
//        va_list argumentList;
//        if (otherButtonTitles)
//        {
//            [arguments addObject: otherButtonTitles];
//            va_start(argumentList, otherButtonTitles);
//            while ((eachObject = va_arg(argumentList, id)))
//            {
//                [arguments addObject: eachObject];
//            }
//            va_end(argumentList);
//        }
//        
//        self.title = title;
//        self.delegate = delegate;
//        self.cancelTitle = cancelButtonTitle;
//        self.otherTitles = arguments;
//        
//        self.buttonBgHeight = 100 + 60 + (int)[arguments count]*65;
//        
//        [arguments release];
//        
//        [self setLayout];
//    }
//    return self;
//    
//}

- (id)init{
    self = [super init];
    if(self){
        
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
    
    numberButtonWidth = screenWidth/3;
    numberButtonHeight = 52;
    
    //背景透明圖 (阻擋parent view按鈕響應)
    self.backgroundView = [[UIView new]autorelease];
    self.backgroundView.backgroundColor = [UIColor clearColor];
    self.backgroundView.frame = CGRectMake(0, 0, screenWidth,screenHeight);
    self.backgroundView.userInteractionEnabled = YES;
    self.backgroundView.exclusiveTouch = YES;
    [self addSubview:self.backgroundView];
    
    /**
     * Number Pad Separator lines
     */
    
    UIColor *lineColor = [UIColor grayColor];

    
    UIView *hLine1 = [UIView new];
    hLine1.frame = CGRectMake(0,self.backgroundView.bounds.size.height-numberButtonHeight*4, 320, 1);
    hLine1.backgroundColor = lineColor;
    [self.backgroundView addSubview:hLine1];
    [hLine1 release];

    UIView *hLine2 = [UIView new];
    hLine2.frame = CGRectMake(0,self.backgroundView.bounds.size.height-numberButtonHeight*3, 320, 1);
    hLine2.backgroundColor = lineColor;
    [self.backgroundView addSubview:hLine2];
    [hLine2 release];
    
    UIView *hLine3 = [UIView new];
    hLine3.frame = CGRectMake(0,self.backgroundView.bounds.size.height-numberButtonHeight*2, 320, 1);
    hLine3.backgroundColor = lineColor;
    [self.backgroundView addSubview:hLine3];
    [hLine3 release];
    
    UIView *hLine4 = [UIView new];
    hLine4.frame = CGRectMake(0,self.backgroundView.bounds.size.height-numberButtonHeight*1, 320, 1);
    hLine4.backgroundColor = lineColor;
    [self.backgroundView addSubview:hLine4];
    [hLine4 release];
    
    UIView *vLine1 = [UIView new];
    vLine1.frame = CGRectMake(numberButtonWidth,self.backgroundView.bounds.size.height-numberButtonHeight*4, 1, self.backgroundView.bounds.size.height);
    vLine1.backgroundColor = lineColor;
    [self.backgroundView addSubview:vLine1];
    [vLine1 release];
    
    UIView *vLine2 = [UIView new];
    vLine2.frame = CGRectMake(numberButtonWidth*2,self.backgroundView.bounds.size.height-numberButtonHeight*4, 1, self.backgroundView.bounds.size.height);
    vLine2.backgroundColor = lineColor;
    [self.backgroundView addSubview:vLine2];
    [vLine2 release];
    
    /**
     * Number Buttons
     */
    
    UIButton *numberButton1 = [self getNumberButtonWithTitle:@"1" AndTagNumber:1 andXOffset:0 andYOffset:4];
    [self.backgroundView addSubview:numberButton1];

    UIButton *numberButton2 = [self getNumberButtonWithTitle:@"2" AndTagNumber:2 andXOffset:1 andYOffset:4];
    [self.backgroundView addSubview:numberButton2];
    
    UIButton *numberButton3 = [self getNumberButtonWithTitle:@"3" AndTagNumber:3 andXOffset:2 andYOffset:4];
    [self.backgroundView addSubview:numberButton3];
    
    UIButton *numberButton4 = [self getNumberButtonWithTitle:@"4" AndTagNumber:4 andXOffset:0 andYOffset:3];
    [self.backgroundView addSubview:numberButton4];
    
    UIButton *numberButton5 = [self getNumberButtonWithTitle:@"5" AndTagNumber:5 andXOffset:1 andYOffset:3];
    [self.backgroundView addSubview:numberButton5];
    
    UIButton *numberButton6 = [self getNumberButtonWithTitle:@"6" AndTagNumber:6 andXOffset:2 andYOffset:3];
    [self.backgroundView addSubview:numberButton6];
    
    UIButton *numberButton7 = [self getNumberButtonWithTitle:@"7" AndTagNumber:7 andXOffset:0 andYOffset:2];
    [self.backgroundView addSubview:numberButton7];
    
    UIButton *numberButton8 = [self getNumberButtonWithTitle:@"8" AndTagNumber:8 andXOffset:1 andYOffset:2];
    [self.backgroundView addSubview:numberButton8];
    
    UIButton *numberButton9 = [self getNumberButtonWithTitle:@"9" AndTagNumber:9 andXOffset:2 andYOffset:2];
    [self.backgroundView addSubview:numberButton9];
    
    UIButton *numberButton0 = [self getNumberButtonWithTitle:@"0" AndTagNumber:0 andXOffset:1 andYOffset:1];
    [self.backgroundView addSubview:numberButton0];
    
    UIButton *numberButtonDelete = [UIButton new];
    numberButtonDelete.frame = CGRectMake(numberButtonWidth*2+1, self.backgroundView.bounds.size.height-numberButtonHeight*1+1, numberButtonWidth-2, numberButtonHeight-2);
    [numberButtonDelete setImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
    [numberButtonDelete setImage:[UIImage imageNamed:@"delete"] forState:UIControlStateHighlighted];
    [numberButtonDelete setBackgroundImage:[UIImage imageNamed:@"phone_press"] forState:UIControlStateHighlighted];
    [numberButtonDelete addTarget:self action:@selector(deleteButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    numberButtonDelete.tag = 111;
    [self.backgroundView addSubview:numberButtonDelete];
    [numberButtonDelete release];
    
    UIButton *numberButtonCancel = [UIButton new];
    numberButtonCancel.frame = CGRectMake(numberButtonWidth*0+1, self.backgroundView.bounds.size.height-numberButtonHeight*1+1, numberButtonWidth-2, numberButtonHeight-2);
    [numberButtonCancel setTitle:@"取消" forState:UIControlStateNormal];
    numberButtonCancel.titleLabel.font = [UIFont systemFontOfSize:12];
    [numberButtonCancel setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [numberButtonCancel setBackgroundImage:[UIImage imageNamed:@"phone_press"] forState:UIControlStateHighlighted];
    [numberButtonCancel addTarget:self action:@selector(cancelButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    numberButtonCancel.tag = 222;
    [self.backgroundView addSubview:numberButtonCancel];
    [numberButtonCancel release];
    
}

- (UIButton *)getNumberButtonWithTitle:(NSString *)title AndTagNumber:(int)tagNumber andXOffset:(int)xOffset andYOffset:(int)yOffset{
    
    UIButton *numberButton = [UIButton new];
    
    numberButton.frame = CGRectMake(numberButtonWidth*xOffset+1, self.backgroundView.bounds.size.height-numberButtonHeight*yOffset+1, numberButtonWidth-2, numberButtonHeight-2);
    [numberButton setTitle:title forState:UIControlStateNormal];
    [numberButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [numberButton setBackgroundImage:[UIImage imageNamed:@"phone_press"] forState:UIControlStateHighlighted];
    [numberButton addTarget:self action:@selector(numberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    numberButton.tag = tagNumber;
    
    return [numberButton autorelease];
    
}

- (void)showInView:(UIView *)view{
    
    [view addSubview:self];
    
    [self.superview resignFirstResponder];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    //    [view addSubview:self.backgroundView];
    
    //讓View顯示在最上層
    //    [[UIApplication sharedApplication].keyWindow addSubview:self.backgroundView];
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

- (void)numberButtonClick:(UIButton *)button{
    
    if([self.delegate respondsToSelector:@selector(chooseNumber:)]){
        [self.delegate chooseNumber:button.tag];
    }
}

- (void)deleteButtonClick:(UIButton *)button{
    
    if([self.delegate respondsToSelector:@selector(deleteNumber)]){
        [self.delegate deleteNumber];
    }
}

- (void)cancelButtonClick:(UIButton *)button{
    
    if([self.delegate respondsToSelector:@selector(cancelNumberPad)]){
        [self.delegate cancelNumberPad];
    }
}

//- (void)otherBbuttonClick:(id)sender{
//    
//    UIButton *button = (UIButton *)sender;
//    if([self.delegate respondsToSelector:@selector(pokeActionSheet:clickedButtonAtIndex:)]){
//        [self.delegate pokeActionSheet:self clickedButtonAtIndex:button.tag];
//    }
//    
//    CGRect screenRect = [[UIScreen mainScreen] bounds];
//    CGFloat screenWidth = screenRect.size.width;
//    CGFloat screenHeight = screenRect.size.height;
//    
//    [UIView animateWithDuration:0.3
//                          delay:0.1
//                        options: UIViewAnimationOptionCurveEaseIn
//                     animations:^{
//                         self.buttonBgImageView.frame = CGRectMake(0, screenHeight, screenWidth, self.buttonBgHeight);
//                     }
//                     completion:^(BOOL finished){
//                         if (finished)
//                             [self.backgroundView removeFromSuperview];
//                     }];
//    
//}
//
//- (void)cancelButtonClick:(id)sender{
//    
//    CGRect screenRect = [[UIScreen mainScreen] bounds];
//    CGFloat screenWidth = screenRect.size.width;
//    CGFloat screenHeight = screenRect.size.height;
//    
//    [UIView animateWithDuration:0.3
//                          delay:0.1
//                        options: UIViewAnimationOptionCurveEaseIn
//                     animations:^{
//                         self.buttonBgImageView.frame = CGRectMake(0, screenHeight, screenWidth, self.buttonBgHeight);
//                     }
//                     completion:^(BOOL finished){
//                         if (finished)
//                             [self.backgroundView removeFromSuperview];
//                     }];
//    
//    if([self.delegate respondsToSelector:@selector(pokeActionSheet:clickedButtonAtIndex:)]){
//        [self.delegate pokeActionSheet:self clickedButtonAtIndex:0];
//    }
//}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
