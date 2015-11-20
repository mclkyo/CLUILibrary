//
//  CALayer+Anim.m
//  CLGestureLock
//
//  Created by yilecity on 15/8/18.
//  Copyright (c) 2015年 yilecity. All rights reserved.
//

#import "CALayer+Shake.h"

@implementation CALayer (ShakeAnim)


/*
 *  摇动
 */
-(void)shake{
    
    CAKeyframeAnimation *kfa = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    
    CGFloat s = 5;
    
    kfa.values = @[@(-s),@(0),@(s),@(0),@(-s),@(0),@(s),@(0)];
    
    //时长
    kfa.duration = 0.3f;
    
    //重复
    kfa.repeatCount = 2;
    
    //移除
    kfa.removedOnCompletion = YES;
    
    [self addAnimation:kfa forKey:@"shake"];
}

@end

