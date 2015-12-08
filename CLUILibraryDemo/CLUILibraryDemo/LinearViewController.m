//
//  LinearViewController.m
//  CLUILibraryDemo
//
//  Created by yilecity on 15/12/8.
//  Copyright (c) 2015年 yilecity. All rights reserved.
//

#import "LinearViewController.h"

@interface LinearViewController ()

@end

@implementation LinearViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    for(int i=0;i<10;i++){
        UIImageView *img = [[UIImageView alloc]init];
        img.frame = CGRectMake(0, 0, 50, 50);
        img.image = [UIImage imageNamed:@"t.jpg"];
        [self.linearLayout addViewWithMaring:img Margin:UIEdgeInsetsMake(0, 0, 10, 10)];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
