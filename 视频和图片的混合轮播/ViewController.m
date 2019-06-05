//
//  ViewController.m
//  视频和图片的混合轮播
//
//  Created by xzmwkj on 2018/7/10.
//  Copyright © 2018年 WangShuai. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"图片和视频的轮播";
    
}

- (IBAction)buttonTaped:(UIButton *)sender {
    [self.navigationController pushViewController:[TestViewController new] animated:YES];
}

@end
