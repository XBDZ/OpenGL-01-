//
//  HBViewController.m
//  OpenGL ES-01
//
//  Created by Liu on 2018/3/7.
//  Copyright © 2018年 Liu. All rights reserved.
//

#import "HBViewController.h"
#import "HBView.h"
@interface HBViewController ()

@property(nonatomic,strong)HBView* myView;
@end

@implementation HBViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.myView = (HBView *)self.view;

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
