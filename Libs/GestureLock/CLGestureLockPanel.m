//
//  CLGestureLockPanel.m
//  CLGestureLock
//
//  Created by yilecity on 15/8/17.
//  Copyright (c) 2015年 yilecity. All rights reserved.
//

#import "CLGestureLockPanel.h"

@interface CLGestureLockPanel()

@property (nonatomic, strong) NSMutableArray *circleSet;
@property (nonatomic, assign) CGPoint currentPoint;
@property (nonatomic, assign) BOOL hasClean;

@end



@implementation CLGestureLockPanel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)commonInit{
    self.backgroundColor = [UIColor clearColor];
    self.circleSet = [[NSMutableArray alloc]init];
    [self lockViewPrepare];
}

- (id)init
{
    if (self = [super init]) {
        [self commonInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
}



-(void)drawRect:(CGRect)rect{
    
    // 如果没有任何选中按钮， 直接retrun
    if (self.circleSet == nil || self.circleSet.count == 0) return;
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //CGContextAddRect(ctx, rect);
    
    for (int index = 0; index < self.circleSet.count; index++) {
        
        // 取出选中按钮
        CLCircleView *circle = self.circleSet[index];
        
        if (index == 0) { // 起点按钮
            CGContextMoveToPoint(ctx, circle.center.x, circle.center.y);
        }else{
            CGContextAddLineToPoint(ctx, circle.center.x, circle.center.y); // 全部是连线
        }
    }
    
    
    if (CGPointEqualToPoint(self.currentPoint, CGPointZero) == NO) {
        
        [self.subviews enumerateObjectsUsingBlock:^(CLCircleView *circle, NSUInteger idx, BOOL *stop) {            
            CGContextAddLineToPoint(ctx, self.currentPoint.x, self.currentPoint.y);
        }];
    }


    //线条转角样式
    CGContextSetLineCap(ctx, kCGLineCapRound);
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    
    // 设置绘图的属性
    CGContextSetLineWidth(ctx, 1);
    
    // 线条颜色
    [self.Config.ConnectLineNormalColor set];
    
    //渲染路径
    CGContextStrokePath(ctx);
    
}


-(void)lockViewPrepare{
    if(self.Config == nil){
        self.Config = [[CLGestureLockConfig alloc]init];
    }
    
    for (NSUInteger i=0; i<9; i++) {
        
        CLCircleView *circle = [[CLCircleView alloc] init];
        circle.Config = self.Config;

        [self addSubview:circle];
    }
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    CGFloat itemViewWH = 30 * 2;
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


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self gestureEndResetMembers];
    
    self.currentPoint = CGPointZero;
    UITouch *touch =  [touches anyObject];
    CGPoint point = [touch locationInView:self];
    
    [self.subviews enumerateObjectsUsingBlock:^(CLCircleView *circle, NSUInteger idx, BOOL *stop) {
        
        if(CGRectContainsPoint(circle.frame, point)){
            [circle setState:CircleStateSelected];
            [self.circleSet addObject:circle];
        }
    }];
    
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    self.currentPoint = CGPointZero;
    UITouch *touch =  [touches anyObject];
    CGPoint point = [touch locationInView:self];
    
    [self.subviews enumerateObjectsUsingBlock:^(CLCircleView *circle, NSUInteger idx, BOOL *stop) {
        
        if(CGRectContainsPoint(circle.frame, point)){
            if([self.circleSet containsObject:circle]){
                
            }
            else{
                [circle setState:CircleStateSelected];
                [self.circleSet addObject:circle];
                [self calAngleAndconnectTheJumpedCircle];
            }
            
        }else{
            
            self.currentPoint = point;
        }
    }];
    
    [self setNeedsDisplay];    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [self setHasClean:NO];
    
    NSString *gesture = [self getGestureResultFromCircleSet:self.circleSet];
    CGFloat length = [gesture length];
    
    if (length == 0) {
        return;
    }
    
    if([self.delegate respondsToSelector:@selector(GestureLockFinish:)]){
        [self.delegate GestureLockFinish:gesture];
    }
        
}


#pragma mark - 每添加一个圆，就计算一次方向
-(void)calAngleAndconnectTheJumpedCircle{
    
    if(self.circleSet == nil || [self.circleSet count] <= 1) return;
    
    //取出最后一个对象
    CLCircleView *lastOne = [self.circleSet lastObject];
    
    //倒数第二个
    CLCircleView *lastTwo = [self.circleSet objectAtIndex:(self.circleSet.count -2)];
    
    //计算倒数第二个的位置
    CGFloat last_1_x = lastOne.center.x;
    CGFloat last_1_y = lastOne.center.y;
    CGFloat last_2_x = lastTwo.center.x;
    CGFloat last_2_y = lastTwo.center.y;
    
    // 1.计算角度（反正切函数）
    CGFloat angle = atan2(last_1_y - last_2_y, last_1_x - last_2_x) + M_PI_2;
    [lastTwo setAngle:angle];
    lastTwo.arrow = YES;
}

#pragma mark - 是否错误回显重绘
/**
 *  是否错误回显重绘
 */
- (void)errorToDisplay
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self gestureEndResetMembers];
    });
}

#pragma mark - 手势结束时的清空操作
/**
 *  手势结束时的清空操作
 */
- (void)gestureEndResetMembers
{
    @synchronized(self) { // 保证线程安全
        if (!self.hasClean) {
            
            // 手势完毕，选中的圆回归普通状态
            [self changeCircleInCircleSetWithState:CircleStateNormal];
            
            // 清空数组
            [self.circleSet removeAllObjects];
            
            // 清空方向
            [self.subviews enumerateObjectsUsingBlock:^(CLCircleView *obj, NSUInteger idx, BOOL *stop) {
                [obj setAngle:0];
                obj.arrow = NO;
            }];
            
            // 完成之后改变clean的状态
            [self setHasClean:YES];
        }
    }
}

#pragma mark - 改变选中数组CircleSet子控件状态
- (void)changeCircleInCircleSetWithState:(CircleState)state
{
    [self.circleSet enumerateObjectsUsingBlock:^(CLCircleView *circle, NSUInteger idx, BOOL *stop) {
        
        [circle setState:state];
    }];
    
    [self setNeedsDisplay];
}


#pragma mark - 将circleSet数组解析遍历，拼手势密码字符串
- (NSString *)getGestureResultFromCircleSet:(NSMutableArray *)circleSet
{
    NSMutableString *gesture = [NSMutableString string];
    
    for (CLCircleView *circle in circleSet) {
        // 遍历取tag拼字符串
        [gesture appendFormat:@"%@", @(circle.tag)];
    }
    
    return gesture;
}

@end
