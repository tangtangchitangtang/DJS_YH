//
//  HomeViewController.m
//  yonghu
//
//  Created by 浪尖渝力 on 2018/1/15.
//  Copyright © 2018年 com.DJS. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeView.h"

@interface HomeViewController ()
@property(nonatomic,strong)HomeView *aView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self wr_setNavBarBackgroundAlpha:0];
    _aView=[HomeView new];
    [self.view addSubview:_aView];
    [_aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
    }];
    _aView.viewController=self;
    [self loginView];
}
-(void)loginView{
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:@"0",@"carousel_type", nil];
    [ZQTools AFNPostDataUrl:@"api/index/banner_list" Dict:dic andTableView:nil andView:self.view andSuccessBlock:^(id responseObject) {
        _aView.CarouselArr=responseObject;
        [_aView creatView];
    } anderrorBlock:nil];
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
