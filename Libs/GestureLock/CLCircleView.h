//
//  CircleView.h
//  CLGestureLock
//
//  Created by yilecity on 15/8/17.
//  Copyright (c) 2015年 yilecity. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLGestureLockConfig.h"


@interface CLCircleView : UIView{
    
}

@property(nonatomic,assign)CircleState state;
@property(nonatomic,strong)CLGestureLockConfig *Config;
@property(nonatomic,assign)CGFloat radio;

@property (nonatomic, assign) BOOL arrow;
@property (nonatomic,assign) CGFloat angle;

@end
