//
//  ViewController.m
//  IOSCustomizedUIToolBox
//
//  Created by Arthur Lin on 2014/12/5.
//  Copyright (c) 2014年 Arthur Lin. All rights reserved.
//

#import "ViewController.h"
#import "ALNumberPad.h"

@interface ViewController ()<ALNumberPadDelegate>

// ALNumberPad
@property(nonatomic,retain)NSMutableArray *numberArray;

@end

@implementation ViewController

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    
    if(self){
        // ALNumberPad
        self.numberArray = [[NSMutableArray new]autorelease];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *numberPadButton = [UIButton buttonWithType:UIButtonTypeCustom];
    numberPadButton.frame = CGRectMake(10, 20, 100, 20);
    [numberPadButton setTitle:@"NumberPad" forState:UIControlStateNormal];
    [numberPadButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [numberPadButton addTarget:self action:@selector(numberPadButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:numberPadButton];
    
}

- (void)numberPadButtonClick:(id)sender{
    
    ALNumberPad *alNumberPad = [ALNumberPad new];
    alNumberPad.delegate = self;
    [alNumberPad showInView:self.view];
    
}

#pragma mark - ALNumberPadDelegate;

- (void)alNumberPadChoose:(ALNumberPad *)numberPad withNumber:(int)number{
    [self.numberArray addObject:[NSNumber numberWithInt:number]];
    NSLog(@"%@",self.numberArray);
}

- (void)alNumberPadDeleteNumber:(ALNumberPad *)numberPad{
    [self.numberArray removeLastObject];
    NSLog(@"%@",self.numberArray);
}

- (void)alNumberPadCancelPad:(ALNumberPad *)numberPad{
    [numberPad resignFirstResponder];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
