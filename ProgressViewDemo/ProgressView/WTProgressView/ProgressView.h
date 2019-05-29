//
//  ProgressView.h
//
//  Created by Sean on 16/5/25.
//  Copyright © 2016年 李伟彤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgressView : UIView

/** 渐变色 */
@property (nonatomic, strong, nonnull)NSArray<UIColor* >* gradientColors;
/** 进度 */
@property (nonatomic, assign)CGFloat progress;

@end
