

//
//  HBViewController.m
//  OpenGL-旋转的立方体
//
//  Created by Liu on 2018/3/12.
//  Copyright © 2018年 Liu. All rights reserved.
//

#import "HBViewController.h"
#import "HBView.h"

@interface HBViewController ()

@property(nonatomic,strong)HBView *cView;

@end

@implementation HBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.cView = (HBView *)self.view;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
