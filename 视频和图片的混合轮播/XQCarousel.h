//
//  XQCarousel.h
//  视频和图片的混合轮播
//
//  Created by xzmwkj on 2018/7/10.
//  Copyright © 2018年 WangShuai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XQCarousel : UIView

@property (nonatomic, strong) NSArray *contentArray;

+ (instancetype)scrollViewFrame:(CGRect)frame imageStringGroup:(NSArray *)imgArray;

@end
