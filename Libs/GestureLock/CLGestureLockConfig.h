//
//  GestureLockConfig.h
//  CLGestureLock
//
//  Created by yilecity on 15/8/17.
//  Copyright (c) 2015年 yilecity. All rights reserved.
//

#define rgba(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

#import <UIKit/UIKit.h>

typedef enum{
    CircleStateNormal = 1,
    CircleStateSelected,
    CircleStateError,
    CircleStateLastOneSelected,
    CircleStateLastOneError
}CircleState;

@interface CLGestureLockColorConfig : NSObject

@property(nonatomic,strong)UIColor *InCircleColor;
@property(nonatomic,strong)UIColor *OutCircleColor;
@property(nonatomic,strong)UIColor *ArrowColor;
@property(nonatomic,assign)CircleState state;

+(CLGestureLockColorConfig*)NormalColor;
+(CLGestureLockColorConfig*)SelectedColor;
+(CLGestureLockColorConfig*)ErrorColor;
+(CLGestureLockColorConfig*)LastOneSelectedColor;
+(CLGestureLockColorConfig*)LastOneErrorColor;


@end


@interface CLGestureLockConfig : NSObject

@property(nonatomic,strong)CLGestureLockColorConfig *NormalColor;
@property(nonatomic,strong)CLGestureLockColorConfig *SelectedColor;
@property(nonatomic,strong)CLGestureLockColorConfig *ErrorColor;
@property(nonatomic,strong)CLGestureLockColorConfig *LastOneSelectedColor;
@property(nonatomic,strong)CLGestureLockColorConfig *LastOneErrorColor;

@property(nonatomic,strong)UIColor *ConnectLineNormalColor;
@property(nonatomic,strong)UIColor *ConnectLineErrorColor;

-(CLGestureLockColorConfig*)GetColorConfig:(CircleState)state;

@end


