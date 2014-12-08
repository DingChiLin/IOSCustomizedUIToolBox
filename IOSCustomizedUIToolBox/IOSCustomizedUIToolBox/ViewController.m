//
//  ViewController.m
//  IOSCustomizedUIToolBox
//
//  Created by Arthur Lin on 2014/12/5.
//  Copyright (c) 2014年 Arthur Lin. All rights reserved.
//

#import "ViewController.h"
#import "ALNumberPad.h"
#import "ALActionSheet.h"
#import "ALAlertView.h"

@interface ViewController ()<ALNumberPadDelegate,ALActionSheetDelegate,ALAlertViewDelegate>

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
    
    /**
     * ALNumberPad
     */
    
    UIButton *numberPadButton = [UIButton buttonWithType:UIButtonTypeCustom];
    numberPadButton.frame = CGRectMake(10, 30, 200, 20);
    [numberPadButton setTitle:@"ALNumberPad" forState:UIControlStateNormal];
    [numberPadButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [numberPadButton addTarget:self action:@selector(numberPadButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [numberPadButton setBackgroundImage:[UIImage imageNamed:@"button"] forState:UIControlStateNormal];
    [self.view addSubview:numberPadButton];
    
    /**
     * ALActionSheet
     */
    
    UIButton *actionSheetButton = [UIButton buttonWithType:UIButtonTypeCustom];
    actionSheetButton.frame = CGRectMake(10, 60, 200, 20);
    [actionSheetButton setTitle:@"ALActionSheet" forState:UIControlStateNormal];
    [actionSheetButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [actionSheetButton addTarget:self action:@selector(actionSheetButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [actionSheetButton setBackgroundImage:[UIImage imageNamed:@"button"] forState:UIControlStateNormal];
    [self.view addSubview:actionSheetButton];
    
    /**
     * ALAlertView
     */
    
    UIButton *alertViewButton = [UIButton buttonWithType:UIButtonTypeCustom];
    alertViewButton.frame = CGRectMake(10, 90, 200, 20);
    [alertViewButton setTitle:@"ALAlertView" forState:UIControlStateNormal];
    [alertViewButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [alertViewButton addTarget:self action:@selector(alertViewButton:) forControlEvents:UIControlEventTouchUpInside];
    [alertViewButton setBackgroundImage:[UIImage imageNamed:@"button"] forState:UIControlStateNormal];
    [self.view addSubview:alertViewButton];
    
}

- (void)numberPadButtonClick:(id)sender{
    
    ALNumberPad *alNumberPad = [ALNumberPad new];
    alNumberPad.delegate = self;
    [alNumberPad showInView:self.view];
    [alNumberPad release];
}

- (void)actionSheetButtonClick:(id)sender{
    
    ALActionSheet *aLActionSheet = [[ALActionSheet alloc]initWithTitle:@"Test Action Sheet" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK",nil];
    [aLActionSheet showInView:self.view];
    [aLActionSheet release];
}

- (void)alertViewButton:(id)sender{
    
    UIImage *image = [UIImage imageNamed:@"logo.gif"];
    ALAlertView *aLAlertView = [[ALAlertView alloc]initWithTitle:@"Test" image:image message:@"Hello!" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"1",@"2",nil];
    [aLAlertView show];
    [aLAlertView release];
}

#pragma mark - ALNumberPadDelegate;

- (void)alNumberPadChoose:(ALNumberPad *)numberPad withNumber:(int)number{
    [self.numberArray addObject:[NSNumber numberWithInt:number]];
    NSLog(@"Number Pad After Choose: %@",self.numberArray);
}

- (void)alNumberPadDeleteNumber:(ALNumberPad *)numberPad{
    [self.numberArray removeLastObject];
    NSLog(@"Number Pad After Delete: %@",self.numberArray);
}

- (void)alNumberPadCancelPad:(ALNumberPad *)numberPad{
    [numberPad resignFirstResponder];
    [self.numberArray removeAllObjects];
}

#pragma mark - ALActionSheetDelegate

- (void)aLActionSheet:(ALActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"Action Sheet Click: %ld",(long)buttonIndex);
}

#pragma mark - ALAlertViewDelegate
- (void) aLAlertView:(ALAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"Alert View Click: %ld",(long)buttonIndex);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
