//
//  ArrayViewController.m
//  LNMasonryCategory
//
//  Created by Ning.liu on 2017/2/19.
//  Copyright © 2017年 ning.lennon@gmail.com. All rights reserved.
//

#import "ArrayViewController.h"
#import "NSArray+LNMASAdditions.h"


@interface ArrayViewController ()

@end

@implementation ArrayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *firstView = [[UIView alloc] init];
    firstView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:firstView];
    [firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo([NSValue valueWithCGSize:CGSizeMake(120, 20)]);
    }];
    UIView *secondView = [[UIView alloc] init];
    secondView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:secondView];
    [secondView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo([NSValue valueWithCGSize:CGSizeMake(30, 30)]);
    }];
    UIView *thirdView = [[UIView alloc] init];
    thirdView.backgroundColor = [UIColor redColor];
    [self.view addSubview:thirdView];
    [thirdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo([NSValue valueWithCGSize:CGSizeMake(80, 50)]);
    }];
    [@[firstView,secondView,thirdView] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@(0));
    }];
    [@[firstView,secondView,thirdView] ln_mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withLeadSpacing:20 tailSpacing:20];
    
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
