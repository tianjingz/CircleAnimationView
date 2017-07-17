//
//  CircleAnimationView.h
//  FuShengShangCheng
//
//  Created by fsjx on 2017/6/28.
//  Copyright © 2017年 fsjx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>
#import <QuartzCore/QuartzCore.h>

@interface CircleAnimationView : UIView

//背景圆环
@property (strong, nonatomic)CAShapeLayer *ovalSShapeLayer;
//动态圆环
@property (strong, nonatomic)CAShapeLayer *redShapeLayer;
//环的宽度
@property(nonatomic,assign)CGFloat lineWidth;
//动态环的弧度  （0 - 1.0）
@property(nonatomic,assign)CGFloat score;



@end
