//
//  SetGestureLockViewController.m
//  CLUILibraryDemo
//
//  Created by yilecity on 15/11/20.
//  Copyright (c) 2015年 yilecity. All rights reserved.
//

#import "SetGestureLockViewController.h"
#import "CALayer+Shake.h"

@interface SetGestureLockViewController (){
    NSString *FirstGesture;
}

@end

@implementation SetGestureLockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark GestureLock delegate
-(void)GestureLockFinish:(NSString *)gesture{
    if([gesture length]<=4){
        [self.LockPanel changeCircleInCircleSetWithState:CircleStateError];
        [self.LockPanel errorToDisplay];
        self.lblTip.text = @"最少连接4个点，请重新输入";
        [self.lblTip.layer shake];
        return;
    }
    
    if(FirstGesture == nil){
        FirstGesture = gesture;
        [self.LockPanel gestureEndResetMembers];
        self.lblTip.text = @"再次绘制解锁图案";
        
        [self.TipPanel SetGesturePassword:gesture];
        return;
    }
    
    if([gesture isEqualToString:FirstGesture] == NO){
        [self.LockPanel changeCircleInCircleSetWithState:CircleStateError];
        [self.LockPanel errorToDisplay];
        self.lblTip.text = @"两次密码不一致";
        [self.lblTip.layer shake];
        return;
    }
    else{
        
        [[NSUserDefaults standardUserDefaults] setObject:gesture forKey:@"MyGestureLock"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        [self.navigationController popViewControllerAnimated:YES];
    }
    
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
