//
//  CLLinearLayoutView.h
//  CLUILibraryDemo
//
//  Created by yilecity on 15/12/8.
//  Copyright (c) 2015年 yilecity. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM (NSInteger,LinearyOutDirection){
    CLLinearLayoutDirectionHorzontial=1,
    CLLInearLayoutDirectionVertical=2,
};


@interface CLLinearLayoutItem : NSObject

@property(nonatomic,weak)UIView *view;
@property(nonatomic,assign)UIEdgeInsets insets;

@end



@interface CLLinearLayoutView : UIView


-(void)addView:(UIView*)subView;
-(void)addViewWithMaring:(UIView*)subView Margin:(UIEdgeInsets)insets;



@end
