//
//  HomeView.m
//  yonghu
//
//  Created by 浪尖渝力 on 2018/1/15.
//  Copyright © 2018年 com.DJS. All rights reserved.
//

#import "HomeView.h"
#import "ReleaseCaseViewController.h"
#import "DocumentViewController.h"
@implementation HomeView

-(void)creatView{
    
    
    self.backgroundColor=_LightGrey;
    _scrollView=[UIScrollView new];
    [self addSubview:_scrollView];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    _scrollView.scrollsToTop =NO;
    
    _scrollView.showsVerticalScrollIndicator = FALSE;
    _scrollView.showsHorizontalScrollIndicator = FALSE;
    _scrollView.bounces = NO;
    
    if (@available(iOS 11.0, *)) {
        self.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.viewController.automaticallyAdjustsScrollViewInsets = NO;
    }

    
    NSMutableArray *imageArr=[NSMutableArray arrayWithCapacity:0];
    for (int i=0; i<_CarouselArr.count; i++) {
        NSDictionary *dic=_CarouselArr[i];
        NSString *imageStr=[dic objectForKey:@"carousel_img"];
        imageStr=[NSString stringWithFormat:@"%@%@",_addressUrl,imageStr];
        [imageArr addObject:imageStr];
    }
    
    UIView *imageView=[UIView new];
    [_scrollView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(10);
        make.width.mas_equalTo(_mainW);
        make.height.mas_equalTo(_mainH*0.34);
    }];
    
    [ZQTools getHederImage:CGRectMake(0, 10, _mainW,  _mainH*0.34) :imageArr :10 :imageView :^(int value) {
        NSLog(@"%d",value);
    }];
    
    UIView *topView=[UIView new];
    [_scrollView addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(3);
        make.width.mas_equalTo(_mainW-6);
        make.height.mas_equalTo(180);
        make.top.mas_equalTo(imageView.mas_bottom);
    }];
    
    UIView *caseView=[UIView new];
    [topView addSubview:caseView];
    [caseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(_mainW/3-3);
        make.height.mas_equalTo(115);
        make.top.mas_equalTo(8);
    }];
    caseView.backgroundColor=ColorWithRGB(254, 252, 230);
    caseView.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushToReleaseCaseView:)];
    [caseView addGestureRecognizer:tapGesture];
    
    UIImageView *caseImage=[UIImageView new];
    [caseView addSubview:caseImage];
    [caseImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(35);
        make.height.mas_equalTo(45);
        make.centerY.mas_equalTo(-15);
    }];
    caseImage.image=[UIImage imageNamed:@"案件委托"];
    
    UILabel *caseLabel=[UILabel new];
    [caseView addSubview:caseLabel];
    [caseLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(caseImage.mas_bottom).mas_equalTo(10);
    }];
    caseLabel.text=@"案件委托";
    caseLabel.font=[UIFont systemFontOfSize:18];
    caseLabel.textColor=ColorWithRGB(49, 49, 49);
    
    NSArray *arr1=[NSArray arrayWithObjects:@"代写文书",@"个性服务",@"律师费计算",@"诉讼费计算", nil];
    int index=0;
    for (int i=0; i<2; i++) {
        for (int j=0; j<2; j++) {
            
            UIView *view=[UIView new];
            [topView addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(caseView.mas_right).mas_equalTo(3+j*_mainW/3);
                make.top.mas_equalTo(caseView.mas_top).mas_equalTo(60*i);
                make.width.mas_equalTo(_mainW/3-3);
                make.height.mas_equalTo(55);
            }];
            view.backgroundColor=[UIColor whiteColor];
            view.tag=index;
            view.userInteractionEnabled=YES;
            UITapGestureRecognizer *tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushToDocument:)];
            [view addGestureRecognizer:tapGesture2];
            
            UIImageView *image=[UIImageView new];
            [view addSubview:image];
            [image mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(13);
                make.centerY.mas_equalTo(0);
                make.width.mas_equalTo(25);
                make.height.mas_equalTo(25);
            }];
            image.image=[UIImage imageNamed:arr1[index]];
            
            UILabel *label=[UILabel new];
            [view addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(image.mas_right).mas_equalTo(4);
                make.centerY.mas_equalTo(0);
            }];
            label.text=arr1[index];
            label.font=[UIFont systemFontOfSize:14];
            label.textColor=ColorWithRGB(49, 49, 49);
            index+=1;
        }
    }
    
    UIView *freeView=[UIView new];
    [topView addSubview:freeView];
    [freeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.top.mas_equalTo(caseView.mas_bottom).mas_equalTo(3);
        make.width.mas_equalTo(_mainW/2-7);
    }];
    freeView.backgroundColor=[UIColor whiteColor];
    
    
    UIImageView *freeImage=[UIImageView new];
    [freeView addSubview:freeImage];
    [freeImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(-35);
        make.centerY.mas_equalTo(0);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(25);
    }];
    freeImage.image=[UIImage imageNamed:@"免费咨询"];
    
    UILabel *freeLabel=[UILabel new];
    [freeView addSubview:freeLabel];
    [freeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(freeImage.mas_right).mas_equalTo(4);
        make.centerY.mas_equalTo(0);
    }];
    freeLabel.text=@"免费咨询";
    freeLabel.font=[UIFont systemFontOfSize:16];
    freeLabel.textColor=ColorWithRGB(49, 49, 49);
    
    
    UIView *layView=[UIView new];
    [topView addSubview:layView];
    [layView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.top.mas_equalTo(caseView.mas_bottom).mas_equalTo(3);
        make.width.mas_equalTo(_mainW/2-10);
    }];
    layView.backgroundColor=[UIColor whiteColor];
    
    
    UIImageView *layImage=[UIImageView new];
    [layView addSubview:layImage];
    [layImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(-35);
        make.centerY.mas_equalTo(0);
        make.width.mas_equalTo(25);
        make.height.mas_equalTo(25);
    }];
    layImage.image=[UIImage imageNamed:@"法律问答"];
    
    UILabel *layILabel=[UILabel new];
    [layView addSubview:layILabel];
    [layILabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(layImage.mas_right).mas_equalTo(4);
        make.centerY.mas_equalTo(0);
    }];
    layILabel.text=@"法律问答";
    layILabel.font=[UIFont systemFontOfSize:16];
    layILabel.textColor=ColorWithRGB(49, 49, 49);
    
    
    UIImageView *shopImage=[UIImageView new];
    [_scrollView addSubview:shopImage];
    [shopImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(topView);
        make.top.mas_equalTo(topView.mas_bottom).mas_equalTo(8);
        make.height.mas_equalTo(_mainHeight*150);
    }];
    shopImage.image=[UIImage imageNamed:@"法律商城背景图"];
    
    UILabel *shopLabel=[UILabel new];
    [shopImage addSubview:shopLabel];
    [shopLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(-30);
        make.right.mas_equalTo(-100);
    }];
    shopLabel.textColor=[UIColor whiteColor];
    shopLabel.font=[UIFont systemFontOfSize:18];
    shopLabel.text=@"法律商城";
    
    UILabel *shopLabel2=[UILabel new];
    [shopImage addSubview:shopLabel2];
    [shopLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-80);
    }];
    shopLabel2.textColor=[UIColor whiteColor];
    shopLabel2.font=[UIFont systemFontOfSize:14];
    shopLabel2.text=@"精选多个咨询案例和文书模版，供你参考~~";
    
    UIImageView *shopImage2=[UIImageView new];
    [shopImage addSubview:shopImage2];
    [shopImage2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(65);
        make.centerY.mas_equalTo(0);
    }];
    shopImage2.image=[UIImage imageNamed:@"法律商城图标"];
    
    
    UIImageView *shopImage3=[UIImageView new];
    [shopImage addSubview:shopImage3];
    [shopImage3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(18);
        make.centerY.mas_equalTo(30);
    }];
    shopImage3.image=[UIImage imageNamed:@"更多1"];
    
    
    UIImageView *bottomImage=[UIImageView new];
    [_scrollView addSubview:bottomImage];
    [bottomImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(topView);
        make.top.mas_equalTo(shopImage.mas_bottom).mas_equalTo(8);
        make.height.mas_equalTo(400*_mainHeight);
    }];
    bottomImage.image=[UIImage imageNamed:@"优势介绍"];
    
     _scrollView.contentSize = CGSizeMake(0, _mainH*0.34+300+550*_mainHeight);
}

-(void)pushToReleaseCaseView:(UITapGestureRecognizer *)tap{
     NSDictionary *userDic = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
    if (userDic==nil) {
        [ZQTools ToLoging:self.viewController];
        return;
    }
    else{
        ReleaseCaseViewController *releaseCase=[[ReleaseCaseViewController alloc] init];
        [ZQTools pushNextViewController:self.viewController andRootController:releaseCase];
    }
}

-(void)pushToDocument:(UITapGestureRecognizer *)tap{
    NSDictionary *userDic = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
    if (userDic==nil) {
        [ZQTools ToLoging:self.viewController];
        return;
    }
    else{
        if (tap.view.tag==0) {
            DocumentViewController *releaseCase=[[DocumentViewController alloc] init];
            [ZQTools pushNextViewController:self.viewController andRootController:releaseCase];
        }
       
    }
}
@end
