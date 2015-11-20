//
//  CircleView.m
//  CLGestureLock
//
//  Created by yilecity on 15/8/17.
//  Copyright (c) 2015年 yilecity. All rights reserved.
//

#import "CLCircleView.h"
#import <QuartzCore/QuartzCore.h>

@implementation CLCircleView


-(id)init{
    self = [super init];
    self.backgroundColor = [UIColor clearColor];
    self.state = CircleStateNormal;
    self.radio = 0.3;
    
    return self;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    
    CGRect circleRect = CGRectMake(1, 1, rect.size.width - 2 * 1, rect.size.height - 2 * 1);
    
    CLGestureLockColorConfig *ColorConfig = [self.Config GetColorConfig:self.state];
    // 上下文旋转
    [self transFormCtx:ctx rect:rect];
    
    // 画圆环
    [self drawEmptyCircleWithContext:ctx rect:circleRect color:ColorConfig.OutCircleColor];

    [self drawSolidCircleWithContext:ctx rect:rect radio:self.radio color:ColorConfig.InCircleColor];
    
    if (self.arrow) {
        [self drawTrangleWithContext:ctx topPoint:CGPointMake(rect.size.width/2, 10) length:10 color:ColorConfig.ArrowColor];
    }
}




#pragma mark - 画外圆环
/**
 *  画外圆环
 *
 *  @param ctx   图形上下文
 *  @param rect  绘画范围
 *  @param color 绘制颜色
 */
- (void)drawEmptyCircleWithContext:(CGContextRef)ctx rect:(CGRect)rect color:(UIColor *)color
{
    CGMutablePathRef circlePath = CGPathCreateMutable();
    CGPathAddEllipseInRect(circlePath, NULL, rect);
    CGContextAddPath(ctx, circlePath);
    [color set];
    CGContextSetLineWidth(ctx, 1);
    CGContextStrokePath(ctx);
    CGPathRelease(circlePath);
    
    
//    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
//    layer.fillColor = [UIColor clearColor].CGColor;
//    layer.strokeColor = [UIColor greenColor].CGColor;
//    layer.lineWidth = 5;
//    layer.path = circlePath;
//    
    
}

#pragma mark - 画实心圆
/**
 *  画实心圆
 *
 *  @param ctx   图形上下文
 *  @param rect  绘制范围
 *  @param radio 占大圆比例
 *  @param color 绘制颜色
 */
- (void)drawSolidCircleWithContext:(CGContextRef)ctx rect:(CGRect)rect radio:(CGFloat)radio color:(UIColor *)color
{
    CGMutablePathRef circlePath = CGPathCreateMutable();
    CGPathAddEllipseInRect(circlePath, NULL, CGRectMake(rect.size.width/2 * (1 - radio) + 1, rect.size.height/2 * (1 - radio) + 1, rect.size.width * radio - 1 * 2, rect.size.height * radio - 1 * 2));
    [color set];
    
    CGContextAddPath(ctx, circlePath);
    CGContextFillPath(ctx);
    CGPathRelease(circlePath);
}

#pragma mark - 画三角形
/**
 *  画三角形
 *
 *  @param ctx    图形上下文
 *  @param point  顶点
 *  @param length 边长
 *  @param color  绘制颜色
 */
- (void)drawTrangleWithContext:(CGContextRef)ctx topPoint:(CGPoint)point length:(CGFloat)length color:(UIColor *)color
{
    CGMutablePathRef trianglePathM = CGPathCreateMutable();
    CGPathMoveToPoint(trianglePathM, NULL, point.x, point.y);
    CGPathAddLineToPoint(trianglePathM, NULL, point.x - length/2, point.y + length/2);
    CGPathAddLineToPoint(trianglePathM, NULL, point.x + length/2, point.y + length/2);
    CGContextAddPath(ctx, trianglePathM);
    [color set];
    CGContextFillPath(ctx);
    CGPathRelease(trianglePathM);
}

/*
 *  上下文旋转
 */
-(void)transFormCtx:(CGContextRef)ctx rect:(CGRect)rect{
    //    if(self.angle == 0) return;
    CGFloat translateXY = rect.size.width * .5f;
    //平移
    CGContextTranslateCTM(ctx, translateXY, translateXY);
    CGContextRotateCTM(ctx, self.angle);
    //再平移回来
    CGContextTranslateCTM(ctx, -translateXY, -translateXY);
}

- (void)setAngle:(CGFloat)angle
{
    _angle = angle;
    
    [self setNeedsDisplay];
}



- (void)setState:(CircleState)state
{
    _state = state;    
    [self setNeedsDisplay];
}

@end
