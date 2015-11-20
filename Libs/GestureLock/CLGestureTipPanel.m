//
//  CLGestureTipPanel.m
//  CLGestureLock
//
//  Created by yilecity on 15/8/18.
//  Copyright (c) 2015年 yilecity. All rights reserved.
//

#import "CLGestureTipPanel.h"
#import "CLCircleView.h"

@implementation CLGestureTipPanel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)init
{
    if (self = [super init]) {
        // 解锁视图准备
        [self lockViewPrepare];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        // 解锁视图准备
        [self lockViewPrepare];
    }
    return self;
}

/*
 *  解锁视图准备
 */
-(void)lockViewPrepare{
    self.backgroundColor = [UIColor clearColor];
    for (NSUInteger i=0; i<9; i++) {
        CLCircleView *circle = [[CLCircleView alloc] init];
        circle.tag = i+1;
        circle.radio = 1;
        circle.Config = [[CLGestureLockConfig alloc]init];
        [self addSubview:circle];
    }
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    CGFloat itemViewWH = 5 * 2;
    CGFloat marginValue = (self.frame.size.width - 3 * itemViewWH) / 3.0f;
    
    [self.subviews enumerateObjectsUsingBlock:^(UIView *subview, NSUInteger idx, BOOL *stop) {
        
        NSUInteger row = idx % 3;
        
        NSUInteger col = idx / 3;
        
        CGFloat x = marginValue * row + row * itemViewWH + marginValue/2;
        
        CGFloat y = marginValue * col + col * itemViewWH + marginValue/2;
        
        CGRect frame = CGRectMake(x, y, itemViewWH, itemViewWH);
        
        // 设置tag -> 密码记录的单元
        subview.tag = idx + 1;
        
        subview.frame = frame;
    }];
}


-(void)SetGesturePassword:(NSString *)pwd{
    for(int i=0;i<[pwd length];i++){
        NSInteger tag = [[NSString stringWithFormat:@"%c",[pwd characterAtIndex:i]] integerValue];
        
        
        [self.subviews enumerateObjectsUsingBlock:^(CLCircleView *obj, NSUInteger idx, BOOL *stop) {
            
            if(obj.tag == tag){
                [obj setState:CircleStateSelected];
            }
        }];
    }
    [self setNeedsDisplay];
}

-(void)Reset{
    [self.subviews enumerateObjectsUsingBlock:^(CLCircleView *obj, NSUInteger idx, BOOL *stop) {
        [obj setState:CircleStateNormal];
    }];
    [self setNeedsDisplay];
}



@end
