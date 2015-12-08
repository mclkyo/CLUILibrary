//
//  LinearViewController.h
//  CLUILibraryDemo
//
//  Created by yilecity on 15/12/8.
//  Copyright (c) 2015年 yilecity. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLLinearLayoutView.h"
#import "UIView+GetLayoutConstraint.h"

@interface LinearViewController : UIViewController

@property(nonatomic,weak)IBOutlet CLLinearLayoutView *linearLayout;
@property(nonatomic,weak)IBOutlet UIView *myView;

@end
