//
//  ViewController.m
//  TestSDK
//
//  Created by 陈旭 on 2017/1/11.
//  Copyright © 2017年 陈旭. All rights reserved.
//

#import "ViewController.h"
#import <CXSDK/SayHello.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    SayHello *hello = [SayHello new];
    [hello sayHello];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
