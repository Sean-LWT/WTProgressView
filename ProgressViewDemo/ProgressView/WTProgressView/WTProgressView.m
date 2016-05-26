//
//  WTProgressView.m
//
//  Created by Sean on 16/5/26.
//  Copyright © 2016年 李伟彤. All rights reserved.
//

#import "WTProgressView.h"

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
    }
    return self;
}

- (void)setFrame:(CGRect)frame;
{
    [super setFrame:frame];
    self.layer.cornerRadius = frame.size.height/2.0;
    self.clipsToBounds = YES;
}

- (void)drawRect:(CGRect)rect;
{
    if (!self.progressView)
    {
        self.progressView = [[ProgressView alloc] initWithFrame:CGRectMake(-self.frame.size.height/2.0, 0, self.frame.size.width+self.frame.size.height, self.frame.size.height)];
        [self addSubview:self.progressView];
        self.progressView.progress = self.progress;
        self.progressView.gradientColors = self.gradientColors;
    }
}

- (void)setBgColor:(UIColor *)bgColor;
{
    _bgColor = bgColor;
    if ([bgColor isKindOfClass:[UIColor class]])
    {
        self.backgroundColor = bgColor;
    }
}

- (void)setEdgeColor:(UIColor *)edgeColor;
{
    _edgeColor = edgeColor;
    if ([edgeColor isKindOfClass:[UIColor class]])
    {
        self.layer.borderColor = edgeColor.CGColor;
        self.layer.borderWidth = 1;
    }
    else
    {
        self.layer.borderWidth = 0;
    }
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

@end
