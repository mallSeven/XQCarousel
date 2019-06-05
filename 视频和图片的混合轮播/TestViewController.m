//
//  TestViewController.m
//  视频和图片的混合轮播
//
//  Created by 会骑牛的小七 on 2019/6/5.
//  Copyright © 2019 WangShuai. All rights reserved.
//

#import "TestViewController.h"
#import "XQCarousel.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"测试界面";
    self.view.backgroundColor = [UIColor whiteColor];
    
    /**
     测试  数组首位为视频播放的地址，其余为本地图片，可根据实际需要进行更改
     **/
    XQCarousel *carousel = [XQCarousel scrollViewFrame:CGRectMake(0, [UIApplication sharedApplication].statusBarFrame.size.height + 44, self.view.frame.size.width, 300) imageStringGroup:@[@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4", @"1.jpg", @"2.jpg", @"3.jpg"]];
    [self.view addSubview:carousel];
    
}

@end
