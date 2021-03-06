//
//  MyViewController.m
//  yonghu
//
//  Created by 浪尖渝力 on 2018/1/15.
//  Copyright © 2018年 com.DJS. All rights reserved.
//

#import "MyViewController.h"
#import "MyView.h"

@interface MyViewController ()
@property(nonatomic,strong)MyView *aView;
@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self wr_setNavBarBackgroundAlpha:0];
    
    _aView=[MyView new];
    [self.view addSubview:_aView];
    [_aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
    }];
    _aView.viewController=self;
    [_aView creatView];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [self loginView];
}

-(void)loginView{
    NSDictionary *userDic = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
    NSString *token=[userDic objectForKey:@"token"];
    NSNumber *waiter_id1=[userDic objectForKey:@"user_id"];
    NSString *user_id=[NSString stringWithFormat:@"%@",waiter_id1];
    
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:@"0",@"user_role",token,@"token",user_id,@"user_id", nil];
    [ZQTools AFNPostDataUrl:@"user/user/user_info" Dict:dic andTableView:nil andView:self.view andSuccessBlock:^(id responseObject) {
        [ZQTools cleanViewSubviews:_aView];
        _aView.userDic=responseObject;
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
