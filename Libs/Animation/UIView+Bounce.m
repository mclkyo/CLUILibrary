//
//  UIView+Bounce.m
//  CLUILibraryDemo
//
//  Created by yilecity on 15/11/20.
//  Copyright (c) 2015年 yilecity. All rights reserved.
//

#import "UIView+Bounce.h"

@implementation UIView (Bounce)

-(void)bounce{
    self.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.6, 0.6);
    [UIView animateWithDuration:0.2 animations:^{
        self.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.1f, 1.1f);
        self.alpha = 0.5;
    } completion:^(BOOL finished) {
        [self bounceOutAnimationStoped];
    }];
 
}

-(void)bounceOutAnimationStoped{
    
    [UIView animateWithDuration:0.1 animations:^{
         self.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.9, 0.9);
         self.alpha = 0.8;
     }
    completion:^(BOOL finished){
        [self bounceInAnimationStoped];
    }];
}

-(void)bounceInAnimationStoped{
    
    [UIView animateWithDuration:0.1 animations:^{
         self.transform = CGAffineTransformScale(CGAffineTransformIdentity,1, 1);
         self.alpha = 1.0;
     }
     completion:^(BOOL finished){
                         
    }];
}

@end
