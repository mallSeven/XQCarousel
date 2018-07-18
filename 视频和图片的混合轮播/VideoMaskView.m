
//
//  VideoMaskView.m
//  视频和图片的混合轮播
//
//  Created by xzmwkj on 2018/7/13.
//  Copyright © 2018年 WangShuai. All rights reserved.
//

#import "VideoMaskView.h"

@interface VideoMaskView ()

// ******* 底部进度条 *******
@property (nonatomic, strong) UIProgressView *progressView;
// ******* 开始播放按钮 *******
@property (nonatomic, strong) UIButton *stratButton;
// ******* 单击手势 *******
@property (nonatomic, strong) UITapGestureRecognizer *singleTap;
// ******* 重新播放按钮 *******
@property (nonatomic, strong) UIButton *replayButton;

@end

@implementation VideoMaskView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self loadUI];
    }
    return self;
}

- (void)loadUI {
    
    [self addSubview:self.stratButton];
    [self addSubview:self.replayButton];
    [self addSubview:self.progressView];

    [self createGesture];
    
}

/*
 *  创建手势
 */
- (void)createGesture {
    // 单击
    self.singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(singleTapAction:)];
    self.singleTap.numberOfTouchesRequired = 1; //手指数
    self.singleTap.numberOfTapsRequired = 1;
    [self addGestureRecognizer:self.singleTap];
}

- (void)singleTapAction:(UITapGestureRecognizer *)tap {
    if (self.progressValue == 1) {
        return;
    }
    if (self.buttonValue) {
        self.buttonValue(XQPlayerStateStart);
    }
}

- (void)setIsStartButton:(BOOL)isStartButton {
    _isStartButton = isStartButton;
    isStartButton ? [self.stratButton setHidden:YES] : [self.stratButton setHidden:NO];
}

- (void)setProgressValue:(CGFloat)progressValue {
    _progressValue = progressValue;
    self.progressView.progress = progressValue;
    progressValue == 1 ? [self.replayButton setHidden:NO] : [self.replayButton setHidden:YES];
}

- (void)playerCurrentTime:(NSInteger)currentTime totalTime:(NSInteger)totalTime sliderValue:(CGFloat)sliderValue {
    self.progressValue = sliderValue;
}

- (UIProgressView *)progressView {
    if (!_progressView) {
        _progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(0, self.frame.size.height - 2, self.frame.size.width, 5)];
        _progressView.progressViewStyle = UIProgressViewStyleDefault;
        _progressView.progressTintColor = [UIColor orangeColor];
        _progressView.progress = 0;
    }
    return _progressView;
}

- (UIButton *)stratButton {
    if (!_stratButton) {
        _stratButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _stratButton.bounds = CGRectMake(0, 0, 40, 40);
        _stratButton.center = self.center;
        [_stratButton setImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
        [_stratButton addTarget:self action:@selector(startButtonTaped) forControlEvents:UIControlEventTouchUpInside];
    }
    return _stratButton;
}

- (UIButton *)replayButton {
    if (!_replayButton) {
        _replayButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _replayButton.bounds = CGRectMake(0, 0, 50, 70);
        _replayButton.center = self.center;
        [_replayButton setImage:[UIImage imageNamed:@"ZFPlayer_repeat_video"] forState:UIControlStateNormal];
        _replayButton.hidden = YES;
        [_replayButton addTarget:self action:@selector(replayButtonTaped) forControlEvents:UIControlEventTouchUpInside];
    }
    return _replayButton;
}

- (void)startButtonTaped {
    if (self.buttonValue) {
        self.buttonValue(XQPlayerStateStart);
    }
}

- (void)replayButtonTaped {
    if (self.buttonValue) {
        self.buttonValue(XQPlayerStateReplay);
    }
}

@end
