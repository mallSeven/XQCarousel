//
//  XQVideoView.h
//  视频和图片的混合轮播
//
//  Created by xzmwkj on 2018/7/10.
//  Copyright © 2018年 WangShuai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XQVideoView : UIView

+ (instancetype)videoViewFrame:(CGRect)frame videoUrl:(NSString *)videoUrl;

// ******* 是否处于播放状态 ******
@property (nonatomic, assign) BOOL isPlay;
// ******* 视频播放地址 ******
@property (nonatomic, strong) NSString *videoUrl;

/*
 * 开始播放
 */
- (void)start;

/*
 * 暂停播放
 */
- (void)stop;

@end
