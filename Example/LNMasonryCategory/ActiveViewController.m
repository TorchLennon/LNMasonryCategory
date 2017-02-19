//
//  ActiveViewController.m
//  LNMasonryCategory
//
//  Created by Ning.liu on 2017/2/19.
//  Copyright © 2017年 ning.lennon@gmail.com. All rights reserved.
//

#import "ActiveViewController.h"
#import "MASConstraint+LNMasonryCategory.h"

@interface ActiveViewController ()
@property (nonatomic,strong) MASConstraint *topHeightConstraint;

@end

@implementation ActiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *topView = ({
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor yellowColor];
        view;
    });
    [self.view addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(@(0));
        make.height.equalTo(@(200)).priorityLow();
        self.topHeightConstraint =
        make.height.equalTo(@(400)).priorityHigh();
    }];
    UIView *bottomView = ({
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor redColor];
        view;
    });
    [self.view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(topView);
        make.top.equalTo(topView.mas_bottom);
        make.bottom.equalTo(self.mas_bottomLayoutGuide);
    }];
    
    UIButton *modifyBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [modifyBtn addTarget:self action:@selector(modifyTopViewConstraint:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:modifyBtn];

}
- (void)modifyTopViewConstraint:(id)sender{
    self.topHeightConstraint.ln_installed = !self.topHeightConstraint.ln_installed;
    [self.view setNeedsLayout];
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:.5 initialSpringVelocity:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
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
