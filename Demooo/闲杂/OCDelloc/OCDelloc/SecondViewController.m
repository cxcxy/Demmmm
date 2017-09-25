//
//  SecondViewController.m
//  OCDelloc
//
//  Created by 陈旭 on 2017/1/4.
//  Copyright © 2017年 陈旭. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
{
    void (^_cycleReferenceBlock)(void);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _cycleReferenceBlock = ^{
        NSLog(@"%@", self);   //引发循环引用
    };
}
-(void)dealloc{
    NSLog(@"SSFF");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
