//
//  UIView+TapEvent.h
//  CLUILibraryDemo
//
//  Created by yilecity on 15/11/9.
//  Copyright (c) 2015年 yilecity. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIView (TapEvent)

-(void)AddTapEvent:(id)target Action:(SEL)action;

-(void)AddTapEventUsBlock:(void(^)(UIView *m))block;

@end
