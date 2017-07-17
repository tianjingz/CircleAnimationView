//
//  CircleAnimationView.m
//  FuShengShangCheng
//
//  Created by fsjx on 2017/6/28.
//  Copyright © 2017年 fsjx. All rights reserved.
//

#import "CircleAnimationView.h"

@implementation CircleAnimationView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self creatLayer:0];
    }
    return self;
}

-(void)creatLayer:(CGFloat)score{
    
    //添加底层白色圆环
    self.ovalSShapeLayer = [[CAShapeLayer alloc]init];
    //圆环颜色
    self.ovalSShapeLayer.strokeColor = [UIColor whiteColor].CGColor;
    //内部填充颜色
    self.ovalSShapeLayer.fillColor = [UIColor clearColor].CGColor;
    //线宽
    self.ovalSShapeLayer.lineWidth = 10;
    //半径
    CGFloat ovalRadius = self.frame.size.height/2*0.8;
    self.ovalSShapeLayer.path =[UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.frame.size.width/2 - ovalRadius, self.frame.size.height/2 - ovalRadius, ovalRadius * 2, ovalRadius * 2)].CGPath;
    self.ovalSShapeLayer.lineCap = kCALineCapRound;
    [self.layer addSublayer:self.ovalSShapeLayer];
    
    //添加填充圆环
    self.redShapeLayer = [[CAShapeLayer alloc]init];
    self.redShapeLayer.strokeColor = [UIColor redColor].CGColor;
    self.redShapeLayer.fillColor = [UIColor clearColor].CGColor;
    self.redShapeLayer.lineWidth = 10;
    
    self.redShapeLayer.path =[UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.frame.size.width/2 - ovalRadius, self.frame.size.height/2 - ovalRadius, ovalRadius * 2, ovalRadius * 2)].CGPath;
    self.redShapeLayer.strokeStart = 0;
    self.redShapeLayer.strokeEnd = score;
    
    [self.layer addSublayer:self.redShapeLayer];
    //strokeStart为0时是从3点钟方向开始，故将其旋转270度从12点钟方向开始
    self.transform = CGAffineTransformMakeRotation((M_PI * 2) / 4 * 3);
    
    [self addAnimation:score];
    
}

-(void)setScore:(CGFloat)score{
    
    _score = score;
    [self creatLayer:score];
    
}
//动态环动画
-(void)addAnimation:(CGFloat)score{
    
    CABasicAnimation * strokeEndAnimate = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeEndAnimate.fromValue = [NSNumber numberWithFloat:0.0];
    strokeEndAnimate.toValue = [NSNumber numberWithFloat:score];
    
    CAAnimationGroup *strokeAnimateGroup = [CAAnimationGroup animation];
    strokeAnimateGroup.duration = 1.5;
    strokeAnimateGroup.repeatCount = 1;
    strokeAnimateGroup.animations = @[strokeEndAnimate];
    
    [self.redShapeLayer addAnimation:strokeAnimateGroup forKey:nil];
    
    
}



@end
