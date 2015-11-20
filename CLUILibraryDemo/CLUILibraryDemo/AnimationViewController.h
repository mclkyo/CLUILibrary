//
//  AnimationViewController.h
//  CLUILibraryDemo
//
//  Created by yilecity on 15/11/20.
//  Copyright (c) 2015年 yilecity. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Bounce.h"

@interface AnimationViewController : ViewController


@property(nonatomic,weak)IBOutlet UIView *bounceView;
-(IBAction)bounceClick:(id)sender;

@end
