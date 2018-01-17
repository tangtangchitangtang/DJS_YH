//
//  UserInfoViewController.m
//  yonghu
//
//  Created by 浪尖渝力 on 2018/1/15.
//  Copyright © 2018年 com.DJS. All rights reserved.
//

#import "UserInfoViewController.h"
#import "UserInfoView.h"
@interface UserInfoViewController ()
@property(nonatomic,strong)UserInfoView *aView;

@end

@implementation UserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title=@"个人中心";
    
    _aView=[UserInfoView new];
    [self.view addSubview:_aView];
    [_aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
    }];
    _aView.dic=_dic;
    [_aView creatView];
    _aView.viewController=self;
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
