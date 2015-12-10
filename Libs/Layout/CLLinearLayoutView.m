//
//  CLLinearLayoutView.m
//  CLUILibraryDemo
//
//  Created by yilecity on 15/12/8.
//  Copyright (c) 2015年 yilecity. All rights reserved.
//

#import "CLLinearLayoutView.h"
#import "UIView+GetLayoutConstraint.h"


@implementation CLLinearLayoutItem


@end



@interface CLLinearLayoutView (){
    NSMutableArray *_lstSubviews;
    LinearyOutDirection _dirction;
}
@end

@implementation CLLinearLayoutView


-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    [self CommonInit];
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    [self CommonInit];
    return self;
}

-(id)init{
    self = [super init];
    [self CommonInit];
    return self;
}


-(void)CommonInit{
    _dirction = CLLinearLayoutDirectionHorzontial;
    _lstSubviews = [NSMutableArray array];
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.offset = UIOffsetZero;
    if([self LayoutHeightConstraint]==nil)
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                  attribute:NSLayoutAttributeHeight
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:nil
                                  attribute:NSLayoutAttributeNotAnAttribute
                                 multiplier:1
                                   constant:0]]; 
}




-(void)addView:(UIView *)subView{
    CLLinearLayoutItem *item = [[CLLinearLayoutItem alloc]init];
    item.view = subView;
    item.offset = UIOffsetZero;
    [_lstSubviews addObject:item];
    
    [self addSubview:subView];
}


-(void)addViewWithMaring:(UIView *)subView Margin:(UIOffset)offset{
    CLLinearLayoutItem *item = [[CLLinearLayoutItem alloc]init];
    item.view = subView;
    item.offset = offset;
    [_lstSubviews addObject:item];
    [self addSubview:subView];
}


-(void)layoutSubviews{
    CGRect rect = self.frame;
    int left = self.offset.horizontal;
    int top = self.offset.vertical;
    int bottomHeight = 0;
    
    for(int i=0; i< _lstSubviews.count;i++){
        CLLinearLayoutItem *item = (CLLinearLayoutItem*)_lstSubviews[i];
        
        if((left + item.view.frame.size.width)>= rect.size.width){
            left = self.offset.horizontal;
            top += item.view.frame.size.height + item.offset.vertical;
        }
        
        item.view.frame = CGRectMake(left, top, item.view.frame.size.width, item.view.frame.size.height);
        left += item.view.frame.size.width + item.offset.horizontal;        
        bottomHeight = item.view.frame.size.height + item.offset.vertical;
    }
    
    
    NSLayoutConstraint *constraint = [self LayoutHeightConstraint];
    constraint.constant = top + bottomHeight;
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    
}




// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code

    NSLog(@"draw");
}
 

@end
