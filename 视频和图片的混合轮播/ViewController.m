//
//  ViewController.m
//  视频和图片的混合轮播
//
//  Created by xzmwkj on 2018/7/10.
//  Copyright © 2018年 WangShuai. All rights reserved.
//

#import "ViewController.h"
#import "XQCarousel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"图片和视频的轮播";
    
    //http://yun.it7090.com/video/XHLaunchAd/video03.mp4
    //http://221.228.226.5/15/t/s/h/v/tshvhsxwkbjlipfohhamjkraxuknsc/sh.yinyuetai.com/88DC015DB03C829C2126EEBBB5A887CB.mp4
    
    /**
     测试  数组首位为视频播放的地址，其余为本地图片，可根据实际需要进行更改
     **/
    XQCarousel *carousel = [XQCarousel scrollViewFrame:CGRectMake(0, 64, self.view.frame.size.width, 300) imageStringGroup:@[@"http://221.228.226.5/15/t/s/h/v/tshvhsxwkbjlipfohhamjkraxuknsc/sh.yinyuetai.com/88DC015DB03C829C2126EEBBB5A887CB.mp4", @"1.jpg", @"2.jpg", @"3.jpg"]];
    [self.view addSubview:carousel];
    
}

@end
