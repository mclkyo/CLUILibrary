//
//  CLGestureLockPanel.h
//  CLGestureLock
//
//  Created by yilecity on 15/8/17.
//  Copyright (c) 2015年 yilecity. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLGestureLockConfig.h"
#import "CLCircleView.h"
#import "CLGestureLockPanelDelegate.h"

@interface CLGestureLockPanel : UIView

@property(nonatomic,strong)CLGestureLockConfig *Config;
@property(nonatomic,assign)IBOutlet id<CLGestureLockPanelDelegate> delegate;

- (void)errorToDisplay;
- (void)changeCircleInCircleSetWithState:(CircleState)state;
- (void)gestureEndResetMembers;

@end
