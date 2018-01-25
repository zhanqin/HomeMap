//
//  HomeIconImageView.m
//  LJMap
//
//  Created by QQ on 2018/1/25.
//  Copyright © 2018年 zhanqin. All rights reserved.
//

#import "HomeIconImageView.h"

@implementation HomeIconImageView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(void)setModel:(HomeIconModel *)model{
    self.image = [UIImage imageNamed:model.icon];
    [self setAnimation];
    self.center = CGPointMake(model.centerX, model.centerY);
    
}

-(void)setAnimation{
    // 设定为缩放
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    // 动画选项设定
    animation.duration = 1.2; // 动画持续时间
    animation.repeatCount = 10000000000; // 重复次数
    animation.autoreverses = YES; // 动画结束时执行逆动画
    
    // 缩放倍数
    animation.fromValue = [NSNumber numberWithFloat:1.0]; // 开始时的倍率
    animation.toValue = [NSNumber numberWithFloat:1.4]; // 结束时的倍率
    
    // 添加动画
    [self.layer addAnimation:animation forKey:@"scale-layer"];
}


@end
