//
//  VerifyGestureLockViewController.h
//  CLUILibraryDemo
//
//  Created by yilecity on 15/11/20.
//  Copyright (c) 2015年 yilecity. All rights reserved.
//

#import "ViewController.h"
#import "CLGestureLockPanel.h"
#import "CALayer+Shake.h"


@interface VerifyGestureLockViewController : ViewController<CLGestureLockPanelDelegate>

@property(nonatomic,strong)IBOutlet CLGestureLockPanel *LockPanel;
@property(nonatomic,strong)IBOutlet UILabel *lblTip;


@end
