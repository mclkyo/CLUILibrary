//
//  UIView+TapEvent.m
//  CLUILibraryDemo
//
//  Created by yilecity on 15/11/9.
//  Copyright (c) 2015年 yilecity. All rights reserved.
//

#import "UIView+TapEvent.h"
#import <objc/runtime.h>


static char TapBlockKey;

@implementation UIView (TapEvent)


-(void)AddTapEvent:(id)target Action:(SEL)action{
    [self setUserInteractionEnabled:YES];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:target action:action];
    [self addGestureRecognizer:tap];
}


-(void)AddTapEventUsBlock:(void (^)(UIView *))block{
    
    [self setUserInteractionEnabled:YES];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(TapWithBlock)];
    [self addGestureRecognizer:tap];
    
    objc_setAssociatedObject(self, &TapBlockKey, block, OBJC_ASSOCIATION_COPY);
}


-(void)TapWithBlock{
    void (^tapblock)(UIView *) = objc_getAssociatedObject(self, &TapBlockKey);
    if(tapblock!=nil){
        tapblock(self);
    }
}



@end