//
//  VideoMaskView.h
//  视频和图片的混合轮播
//
//  Created by xzmwkj on 2018/7/13.
//  Copyright © 2018年 WangShuai. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, XQPlayerState) {
    XQPlayerStateStart,
    XQPlayerStateReplay
};

typedef void(^StartButtonTapedBlock)(XQPlayerState state);

@interface VideoMaskView : UIView

/*
 * 底部进度条的值
 */
@property (nonatomic, assign) CGFloat progressValue;

/*
 * 开始按钮的状态
 */
@property (nonatomic, assign) BOOL isStartButton;

/*
 * 开始按钮点击Block
 */
@property (nonatomic, copy) StartButtonTapedBlock buttonValue;

- (void)playerCurrentTime:(NSInteger)currentTime totalTime:(NSInteger)totalTime sliderValue:(CGFloat)sliderValue;

@end
