//
//  ProgressView.m
//
//  Created by Sean on 16/5/25.
//  Copyright © 2016年 李伟彤. All rights reserved.
//

#import "ProgressView.h"

@implementation ProgressView

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
    [self showRangeWithProgress:progress];
}

- (void)setGradientColors:(NSArray *)gradientColors;
{
    _gradientColors = gradientColors;
    self.backgroundColor = self.gradientColors.firstObject;
    if (self.backgroundColor == nil)
    {
        self.backgroundColor = [UIColor whiteColor];
    }
}

- (void)showRangeWithProgress:(CGFloat )progress;
{
    if(self.frame.size.width <= 0.0 || self.frame.size.height <= 0.0) { return; }
    
    CGSize size = self.frame.size;
    CGFloat x = progress*size.width;
    CGFloat height = size.height/2.0;
    CAShapeLayer* shapeLayer = [CAShapeLayer layer];
    [shapeLayer setFillColor:[UIColor blackColor].CGColor];
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0.0, 0.0);
    CGPathAddLineToPoint(path, NULL,x, 0.0);
    CGPathAddArc(path, NULL, x, height, height,M_PI/-2.0, M_PI/2.0, NO);
    CGPathAddLineToPoint(path, NULL, 0.0, size.height);
    CGPathAddLineToPoint(path, NULL, 0.0, 0.0);
    CGPathCloseSubpath(path);
    
    [shapeLayer setPath:path];
    CFRelease(path);
    self.layer.mask = shapeLayer;
    
    CGRect frame = self.frame;
    self.frame = CGRectMake(frame.origin.x,frame.origin.y,0,frame.size.height);
    [UIView animateWithDuration:1 animations:^{
        self.frame = CGRectMake(frame.origin.x,frame.origin.y,frame.size.width,frame.size.height);
    }];
}

- (void)drawRect:(CGRect)rect;
{
    if (self.gradientColors.count > 1)
    {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextClearRect(context, rect);
        CGContextSaveGState(context);
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();

        int numComponents = 4;
        CGFloat colors[[self.gradientColors count] * numComponents];
        const CGFloat *components[[self.gradientColors count]];
        for (int i = 0; i < [self.gradientColors count]; i++)
        {
            components[i] = CGColorGetComponents(((UIColor *)[self.gradientColors objectAtIndex:i]).CGColor);
            for (int j = 0; j < numComponents; j++)
            {
                colors[i * numComponents + j] = components[i][j];
            }
        }
        CGGradientRef gradient = CGGradientCreateWithColorComponents (colorSpace, colors, NULL, [self.gradientColors count]);

        CGPoint startPoint = CGPointMake(rect.origin.x, 0);
        CGPoint endPoint = CGPointMake(rect.size.width, 0);

        CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
        CGColorSpaceRelease(colorSpace);
        CGGradientRelease(gradient);

        [self showRangeWithProgress:self.progress];
    }
}

@end
