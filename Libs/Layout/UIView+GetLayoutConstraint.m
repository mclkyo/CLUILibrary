//
//  UIView+GetConstraint.m
//  YiIM
//
//  Created by yilecity on 15/11/10.
//  Copyright (c) 2015年 yilecity. All rights reserved.
//

#import "UIView+GetLayoutConstraint.h"

@implementation UIView (GetConstraint)

-(NSLayoutConstraint*)LayoutHeightConstraint{
    NSLayoutConstraint *Constraint = nil;
    for(int i=0;i<self.constraints.count;i++){
        NSLayoutConstraint *contraint = [self.constraints objectAtIndex:i];
        if(contraint.firstAttribute == NSLayoutAttributeHeight && contraint.firstItem == self){
            Constraint = contraint;
            break;
        }
    }
    return Constraint;
}

@end
