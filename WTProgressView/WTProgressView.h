//
//  WTProgressView.h
//
//  Created by Sean on 16/5/26.
//  Copyright © 2016年 李伟彤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProgressView.h"

@interface WTProgressView : UIView

/** 进度条边缘色 */
@property (nonatomic,strong,nullable)UIColor* edgeColor;
/** 进度条底部背景色 */
@property (nonatomic,strong,nullable)UIColor* bgColor;
/** 进度条颜色数组 */
@property (nonatomic,strong,nonnull)NSArray* gradientColors;
/** 进度 */
@property (nonatomic,assign)CGFloat progress;

@end
