//
//  XQCarousel.m
//  视频和图片的混合轮播
//
//  Created by xzmwkj on 2018/7/10.
//  Copyright © 2018年 WangShuai. All rights reserved.
//

#import "XQCarousel.h"
#import "XQVideoView.h"

@interface XQCarousel ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) XQVideoView *videoView;

@end

@implementation XQCarousel

+ (instancetype)scrollViewFrame:(CGRect)frame imageStringGroup:(NSArray *)imgArray {
    XQCarousel *carousel = [[self alloc] initWithFrame:frame];
    carousel.contentArray = imgArray;
    return carousel;
}

- (void)setContentArray:(NSArray *)contentArray {
    _contentArray = contentArray;
    [self loadUI];
}

- (void)loadUI {
    
    self.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    self.scrollView.contentSize = CGSizeMake(self.frame.size.width * self.contentArray.count, self.frame.size.height);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.delegate = self;
    [self addSubview:self.scrollView];
    
    for (NSInteger index = 0; index < self.contentArray.count; index ++) {
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width * index, 0, self.frame.size.width, self.frame.size.height)];
        img.image = [UIImage imageNamed:self.contentArray[index]];
        /** 测试 **/
        if (index == 0) {
            self.videoView = [XQVideoView videoViewFrame:img.frame videoUrl:self.contentArray[index]];
            self.videoView.videoUrl = self.contentArray[index];
            [self.scrollView addSubview:self.videoView];
        }else {
            [self.scrollView addSubview:img];
        }
    }
    
    self.pageControl = [[UIPageControl alloc]init];
    self.pageControl.frame = CGRectMake(0, self.frame.size.height - 30, self.frame.size.width, 30);
    self.pageControl.numberOfPages = self.contentArray.count;
    self.pageControl.currentPage = 0;
    self.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    [self addSubview:self.pageControl];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSInteger currentPage = round(scrollView.contentOffset.x / self.frame.size.width);
    self.pageControl.currentPage = currentPage;
    
    if (self.videoView.isPlay) {
        if (currentPage == 0) {
            [self.videoView start];
        }else {
            [self.videoView stop];
        }
    }
    
}

@end
