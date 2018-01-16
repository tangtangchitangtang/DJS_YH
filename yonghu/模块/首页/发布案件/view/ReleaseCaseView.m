//
//  ReleaseCaseView.m
//  yonghu
//
//  Created by 浪尖渝力 on 2018/1/15.
//  Copyright © 2018年 com.DJS. All rights reserved.
//

#import "ReleaseCaseView.h"
#import "selectRegionView.h"
#import "SelectCaseView.h"

@implementation ReleaseCaseView

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
//    _scrollView.contentSize = CGSizeMake(0,650);
    
    
    UIScrollView *scrollView2=[UIScrollView new];
    [_scrollView addSubview:scrollView2];
    [scrollView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(64);
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(120);
        make.width.mas_equalTo(_mainW);
    }];
    scrollView2.scrollsToTop =NO;
    scrollView2.showsVerticalScrollIndicator = FALSE;
    scrollView2.showsHorizontalScrollIndicator = FALSE;
    scrollView2.bounces = NO;
    scrollView2.contentSize = CGSizeMake(585,0);
    
    UIView *topView=[UIView new];
    [scrollView2 addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(585);
        make.height.mas_equalTo(120);
    }];
    [self creatTopView:topView];
    [self creatView1];
}

-(void)creatTopView:(UIView *)topView{
    UIView *xianView=[UIView new];
    [topView addSubview:xianView];
    [xianView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(25);
        make.right.mas_equalTo(-25);
        make.top.mas_equalTo(35);
        make.height.mas_equalTo(1.5);
    }];
    xianView.backgroundColor=ColorWithRGB(200, 200, 201);
    
    NSArray *arr=[NSArray arrayWithObjects:@"发布委托",@"待回访",@"带签约",@"等待方案",@"律师执行",@"评价",@"完成", nil];
    int index=3;
    for (int i=0; i<arr.count; i++) {
        UIImageView *imageView=[UIImageView new];
        [topView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(85*i+25);
            make.centerY.mas_equalTo(xianView);
            if (i==index) {
                make.width.height.mas_equalTo(33);
            }
            else{
                make.width.height.mas_equalTo(25);
            }
        }];
        if (i>index) {
            imageView.image=[UIImage imageNamed:@"圆-1"];
        }
        else if (index==i) {
            imageView.image=[UIImage imageNamed:@"圆3"];
        }
        else if (index>i){
            imageView.image=[UIImage imageNamed:@"圆2"];
        }
        
        UILabel *label=[UILabel new];
        [topView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(imageView);
            make.bottom.mas_equalTo(-20);
        }];
        label.text=arr[i];
        if (index==i) {
            label.textColor=_backgroundColor;
            label.font=[UIFont systemFontOfSize:18];
        }
        else{
            label.textColor=ColorWithRGB(149, 149, 149);
            label.font=[UIFont systemFontOfSize:15];
        }
    }
}
-(void)creatView1{
    UIView *topView=[UIView new];
    [_scrollView addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(5);
        make.width.mas_equalTo(_mainW-10);
        make.height.mas_equalTo(101);
        make.top.mas_equalTo(195);
    }];
    topView.backgroundColor=[UIColor whiteColor];
    topView.layer.cornerRadius=3;
    
    UIView *nameView=[UIView new];
    [topView addSubview:nameView];
    [nameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(50);
    }];
    UIImageView *nameImage=[UIImageView new];
    [nameView addSubview:nameImage];
    [nameImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(10);
        make.width.mas_equalTo(15);
        make.height.mas_equalTo(20);
    }];
    nameImage.image=[UIImage imageNamed:@"我的"];
    
    UILabel *nameLabel=[UILabel new];
    [nameView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(nameImage.mas_right).mas_equalTo(10);
        make.centerY.mas_equalTo(0);
    }];
    nameLabel.font=[UIFont systemFontOfSize:17];
    nameLabel.text=@"你的称呼";
    nameLabel.textColor=ColorWithRGB(49, 49, 49);
    
    _nameText=[UITextField new];
    [nameView addSubview:_nameText];
    [_nameText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(150);
        make.height.mas_equalTo(40);
    }];
    _nameText.placeholder=@"请输入你的真实姓名";
    _nameText.font=[UIFont systemFontOfSize:15];
    _nameText.textColor=ColorWithRGB(49, 49, 49);
    _nameText.delegate=self;
    _nameText.returnKeyType=UIReturnKeyDone;
    _nameText.textAlignment=NSTextAlignmentRight;
    
    UIView *xianView=[UIView new];
    [topView addSubview:xianView];
    [xianView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(nameView.mas_bottom);
    }];
    xianView.backgroundColor=_LightGrey;
    
    UIView *addView=[UIView new];
    [topView addSubview:addView];
    [addView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(50);
    }];
    UIImageView *addImage=[UIImageView new];
    [addView addSubview:addImage];
    [addImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(10);
        make.width.mas_equalTo(15);
        make.height.mas_equalTo(20);
    }];
    addImage.image=[UIImage imageNamed:@"location"];
    
    UIImageView *imgaeView=[UIImageView new];
    [addView addSubview:imgaeView];
    [imgaeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
        make.width.mas_equalTo(12);
        make.height.mas_equalTo(20);
    }];
    imgaeView.image=[UIImage imageNamed:@"iconfont-fanhui-拷贝-3"];
    
    UILabel *addLabel=[UILabel new];
    [addView addSubview:addLabel];
    [addLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(nameImage.mas_right).mas_equalTo(10);
        make.centerY.mas_equalTo(0);
    }];
    addLabel.font=[UIFont systemFontOfSize:17];
    addLabel.text=@"案件所在地";
    addLabel.textColor=ColorWithRGB(49, 49, 49);
    
    _addLabel=[UILabel new];
    [addView addSubview:_addLabel];
    [_addLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(imgaeView.mas_left).mas_equalTo(-5);
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(150);
    }];
    _addLabel.textAlignment=NSTextAlignmentRight;
    _addLabel.text=@"";
    _addLabel.font=[UIFont systemFontOfSize:15];
    _addLabel.textColor=ColorWithRGB(49, 49, 49);
    
    addView.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(SelectAdd:)];
    [addView addGestureRecognizer:tapGesture];
    
    
    UIView *caseView=[UIView new];
    [_scrollView addSubview:caseView];
    [caseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(topView);
        make.top.mas_equalTo(addView.mas_bottom).mas_equalTo(12);
        make.height.mas_equalTo(55);
    }];
    caseView.backgroundColor=[UIColor whiteColor];
    caseView.layer.cornerRadius=3;
    
    caseView.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(SelectCase:)];
    [caseView addGestureRecognizer:tapGesture2];

    UIImageView *caseImage=[UIImageView new];
    [caseView addSubview:caseImage];
    [caseImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.centerX.mas_equalTo(-40);
        make.width.height.mas_equalTo(25);
    }];
    caseImage.image=[UIImage imageNamed:@"选择案件类型"];
    
    UILabel *caseLabel=[UILabel new];
    [caseView addSubview:caseLabel];
    [caseLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(caseImage.mas_right).mas_equalTo(10);
        make.centerY.mas_equalTo(0);
    }];
    caseLabel.text=@"选择案件类型";
    caseLabel.font=[UIFont systemFontOfSize:18];
    caseLabel.textColor=ColorWithRGB(49, 49, 49);
    
    _bottomView=[UIView new];
    [_scrollView addSubview:_bottomView];
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(topView);
        make.height.mas_equalTo(250);
        make.top.mas_equalTo(caseView.mas_bottom).mas_equalTo(20);
    }];
    
    
    UIImageView *xieYiImage=[UIImageView new];
    [_bottomView addSubview:xieYiImage];
    [xieYiImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.width.height.mas_equalTo(25);
        make.top.mas_equalTo(20);
    }];
    xieYiImage.image=[UIImage imageNamed:@"是"];
    
    UILabel *xieYiLabel=[UILabel new];
    [_bottomView addSubview:xieYiLabel];
    [xieYiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(xieYiImage.mas_right).mas_equalTo(20);
        make.centerY.mas_equalTo(xieYiImage);
    }];
    NSMutableAttributedString *AttributedStr= [[NSMutableAttributedString alloc]initWithString:@"同意《独角兽平台声明》"];
    
    [AttributedStr addAttribute:NSForegroundColorAttributeName value:ColorWithRGB(149, 149, 149) range:NSMakeRange(0, 2)];
    [AttributedStr addAttribute:NSForegroundColorAttributeName value:ColorWithRGB(186, 151, 89) range:NSMakeRange(2, 9)];
    xieYiLabel.attributedText=AttributedStr;
    xieYiLabel.font=[UIFont systemFontOfSize:16];
    
    UIButton *btn=[UIButton new];
    [_bottomView addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo (-20);
        make.height.mas_equalTo(50);
        make.bottom.mas_equalTo(-20);
    }];
    [btn setTitle:@"提交" forState:0];
    [btn setTitleColor:[UIColor whiteColor] forState:0];
    btn.layer.cornerRadius=10;
    btn.backgroundColor=_backgroundColor;
    
}
-(void)SelectAdd:(UITapGestureRecognizer *)tap{
    selectRegionView *addView=[selectRegionView new];
    [self addSubview:addView];
    [addView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
    }];
    addView.customSelectedBlock = ^ (NSDictionary *dic)
    {
        NSString *mergename=[dic objectForKey:@"mergename"];
        NSArray *nameArr=[mergename componentsSeparatedByString:@","];
        NSString *addStr=@"";
        for (int i=0;i< nameArr.count; i++) {
            addStr=[NSString stringWithFormat:@"%@%@",addStr,nameArr[i]];
        }
        _addLabel.text=addStr;
        
    };
    addView.row=2;
    [addView creatView];
    
}
-(void)SelectCase:(UITapGestureRecognizer *)tap{
    SelectCaseView *addView=[SelectCaseView new];
    [self addSubview:addView];
    [addView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
    }];
    addView.customSelectedBlock = ^ (NSDictionary *dic)
    {
        _caseDic=dic;
        [self getCaseViewData];
    };
    addView.index2=3;
    [addView creatView];
}

-(void)getCaseViewData{
    NSNumber *ids=[_caseDic objectForKey:@"ct_id"];
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%@",ids],@"ct_id", nil];
    [ZQTools AFNPostDataUrl:@"user/litigation/get_problem" Dict:dic andTableView:nil andView:self andSuccessBlock:^(id responseObject) {
        [self creatCaseView:responseObject];
    } anderrorBlock:nil];
    
}

-(void)creatCaseView:(NSArray *)tableArr{
    
    UIImageView *lianJieImage=[UIImageView new];
    [_scrollView addSubview:lianJieImage];
    [lianJieImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(40);
        make.top.mas_equalTo(_bottomView.mas_top).mas_equalTo(-30);
        make.width.mas_equalTo(15);
        make.height.mas_equalTo(40);
    }];
    lianJieImage.image=[UIImage imageNamed:@""];
    
    UIView *view=[UIView new];
    [_scrollView addSubview:view];
    view.backgroundColor=[UIColor whiteColor];
    
    float height=0;
    float width=0;
    for (int i=1; i<=tableArr.count; i++) {
        NSDictionary *dic=tableArr[i-1];
        NSNumber *problem_answer_type=[dic objectForKey:@"problem_answer_type"];
        if (problem_answer_type.intValue==1) {
            NSString *problem_title=[dic objectForKey:@"problem_title"];
            CGSize size=[ZQTools getNSStringSize:problem_title andViewWight:_mainW-35 andFont:15];
            UILabel *titleLabel=[UILabel new];
            [view addSubview:titleLabel];
            [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(20+height);
                make.right.mas_equalTo(10);
                make.right.mas_equalTo(-10);
                make.height.mas_equalTo(size.height);
            }];
            titleLabel.text=problem_title;
            titleLabel.textColor=ColorWithRGB(49,49 , 49);
            titleLabel.font=[UIFont systemFontOfSize:15];
            
            height=height+size.height+20;
            
            NSArray *problem_answer=[dic objectForKey:@"problem_answer"];
            for (int j=0 ; j<problem_answer.count; j++) {
                UIImageView *iamgeView=[UIImageView new];
                [view addSubview:iamgeView];
                [iamgeView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.mas_equalTo(25+width);
                    make.width.height.mas_equalTo(25);
//                    make.
                }];
            }
        }
    }
    
    
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString*)string{
    if ([[[UITextInputMode currentInputMode]primaryLanguage] isEqualToString:@"emoji"]) {
        return NO;
    }
    return YES;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
@end
