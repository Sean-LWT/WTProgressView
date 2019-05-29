//
//  WTProgressView.m
//
//  Created by Sean on 16/5/26.
//  Copyright © 2016年 李伟彤. All rights reserved.
//

#import "WTProgressView.h"
#import "ProgressView.h"

@interface WTProgressView ()

@property (nonatomic,strong)ProgressView* progressView;

@end

@implementation WTProgressView

- (instancetype)init;
{
    self = [super init];
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        self.clipsToBounds = YES;
    }
    return self;
}

- (void)layoutSubviews;
{
    [super layoutSubviews];
    self.progressView.frame = CGRectMake(-self.frame.size.height/2.0, 0, self.frame.size.width+self.frame.size.height, self.frame.size.height);
}

- (ProgressView* )progressView;
{
    if (_progressView == nil)
    {
        _progressView = [[ProgressView alloc] initWithFrame:CGRectMake(-self.frame.size.height/2.0, 0, self.frame.size.width+self.frame.size.height, self.frame.size.height)];
        [self addSubview:_progressView];
        _progressView.progress = self.progress;
        _progressView.gradientColors = self.gradientColors;
    }
    return _progressView;
}

- (void)setProgress:(CGFloat)progress;
{
    if (progress < 0.0)
    {
        progress = 0.0;
    }
    else if(progress > 1.0)
    {
        progress = 1.0;
    }
    _progress = progress;
    self.progressView.progress = progress;
}

- (void)setGradientColors:(NSArray<UIColor *> *)gradientColors;
{
    _gradientColors = gradientColors;
    self.progressView.gradientColors = gradientColors;
}

@end
