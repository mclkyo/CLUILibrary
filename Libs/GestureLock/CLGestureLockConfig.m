//
//  GestureLockConfig.m
//  CLGestureLock
//
//  Created by yilecity on 15/8/17.
//  Copyright (c) 2015年 yilecity. All rights reserved.
//

#import "CLGestureLockConfig.h"

@implementation CLGestureLockColorConfig

+(CLGestureLockColorConfig*)NormalColor{
    CLGestureLockColorConfig *config = [[CLGestureLockColorConfig alloc]init];
    config.state = CircleStateNormal;
    config.OutCircleColor = rgba(241,241,241,1);
    config.InCircleColor = [UIColor clearColor];
    config.ArrowColor = [UIColor clearColor];
    return config;
}

+(CLGestureLockColorConfig*)SelectedColor{
    CLGestureLockColorConfig *config = [[CLGestureLockColorConfig alloc]init];
    config.state = CircleStateSelected;
    config.OutCircleColor = rgba(34,178,246,1);
    config.InCircleColor = rgba(34,178,246,1);
    config.ArrowColor = rgba(34,178,246,1);
    return config;
}

+(CLGestureLockColorConfig*)ErrorColor{
    CLGestureLockColorConfig *config = [[CLGestureLockColorConfig alloc]init];
    config.state = CircleStateError;
    
    config.OutCircleColor = rgba(254,82,92,1);
    config.InCircleColor = rgba(254,82,92,1);
    config.ArrowColor = rgba(254,82,92,1);
    
    return config;
}

+(CLGestureLockColorConfig*)LastOneErrorColor{
    CLGestureLockColorConfig *config = [[CLGestureLockColorConfig alloc]init];
    config.state = CircleStateLastOneError;
    config.OutCircleColor = rgba(254,82,92,1);
    config.InCircleColor = rgba(254,82,92,1);
    config.ArrowColor = rgba(254,82,92,1);
    return config;
}


+(CLGestureLockColorConfig*)LastOneSelectedColor{
    CLGestureLockColorConfig *config = [[CLGestureLockColorConfig alloc]init];
    config.state = CircleStateLastOneSelected;
    
    config.OutCircleColor = rgba(34,178,246,1);
    config.InCircleColor = rgba(34,178,246,1);
    config.ArrowColor = rgba(34,178,246,1);
    
    return config;
}





@end



@implementation CLGestureLockConfig

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(CLGestureLockColorConfig*)NormalColor{
    if(_NormalColor==nil){
        _NormalColor = [CLGestureLockColorConfig NormalColor];
    }
    return _NormalColor;
}

-(CLGestureLockColorConfig*)SelectedColor{
    if(_SelectedColor==nil){
        _SelectedColor = [CLGestureLockColorConfig SelectedColor];
    }
    return _SelectedColor;
}

-(CLGestureLockColorConfig*)ErrorColor{
    if(_ErrorColor==nil){
        _ErrorColor = [CLGestureLockColorConfig ErrorColor];
    }
    return _ErrorColor;
}

-(CLGestureLockColorConfig*)LastOneErrorColor{
    if(_LastOneErrorColor==nil){
        _LastOneErrorColor = [CLGestureLockColorConfig LastOneErrorColor];
    }
    return _LastOneErrorColor;
}

-(CLGestureLockColorConfig*)LastOneSelectedColor{
    if(_LastOneSelectedColor==nil){
        _LastOneSelectedColor = [CLGestureLockColorConfig LastOneSelectedColor];
    }
    return _LastOneSelectedColor;
}

-(UIColor*)ConnectLineErrorColor{
    if(_ConnectLineErrorColor==nil){
        _ConnectLineErrorColor = rgba(254,82,92,1);
    }
    return _ConnectLineErrorColor;
}

-(UIColor*)ConnectLineNormalColor{
    if(_ConnectLineNormalColor==nil){
        _ConnectLineNormalColor = rgba(34,178,246,1);
    }
    return _ConnectLineNormalColor;
}




-(CLGestureLockColorConfig*)GetColorConfig:(CircleState)state{
    if(state == CircleStateNormal)
        return self.NormalColor;
    
    if(state == CircleStateSelected)
        return self.SelectedColor;
    
    if(state == CircleStateError)
        return self.ErrorColor;
    
    if(state == CircleStateLastOneSelected)
        return self.LastOneSelectedColor;
    
    if(state == CircleStateLastOneError)
        return self.LastOneErrorColor;
    
    return nil;
}



@end
