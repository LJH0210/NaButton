//
//  ViewController.m
//  NaButton
//
//  Created by ND on 16/2/17.
//  Copyright © 2016年 LJH. All rights reserved.
//

#import "ViewController.h"
#import "NAStatusButton.h"
#import "NAThirdOrderBerzier.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NAStatusButton *bt = [NAStatusButton buttonWithNaButtonType:NAStatusButtonNormal];
    bt.na_StatusButtontouchUpInsideBlock = ^(NAStatusButton *bt){

    };
    bt.frame = CGRectMake(100, 100, 88, 44);
    [self.view addSubview:bt];
    
//    NSArray *ar;
//    [ar enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        *stop = YES;
//    }];
    
//    [path closePath];
    
    
   
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
