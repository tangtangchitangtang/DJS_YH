//
//  selectRegionView.m
//  anFang
//
//  Created by tangtangchitangtang on 2017/9/11.
//  Copyright © 2017年 tangtangchitangtang. All rights reserved.
//

#import "selectRegionView.h"

@implementation selectRegionView
-(void)creatView{
    self.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];

    
    UIView *tuiView=[UIView new];
    [self addSubview:tuiView];
    [tuiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(_mainH*0.4);
    }];
    UITapGestureRecognizer *tuiChuView = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tuiChuView:)];
    [tuiView addGestureRecognizer:tuiChuView];

    
    
    _view=[UIView new];
    [self addSubview:_view];
    [_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(_mainH*0.6);
    }];
    _view.backgroundColor=[UIColor whiteColor];

    UILabel *titleLabel=[UILabel new];
    [_view addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(15);
    }];
    titleLabel.text=@"所在区域";
    titleLabel.font=[UIFont systemFontOfSize:18];
    
    _shengLabel=[UILabel new];
    [_view addSubview:_shengLabel];
    [_shengLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(titleLabel.mas_bottom).mas_equalTo(15);
    }];
    _shengLabel.text=@"请选择";
    _shengLabel.font=[UIFont systemFontOfSize:14];
    _shengLabel.textColor=_backgroundColor;
    _shengLabel.tag=0;
    _shengLabel.userInteractionEnabled=YES;
    UITapGestureRecognizer *selectDianJi = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dianJi:)];
    [_shengLabel addGestureRecognizer:selectDianJi];
    
    UIView *xianView=[UIView new];
    [_view addSubview:xianView];
    [xianView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(_shengLabel.mas_bottom).mas_equalTo(10);
        make.height.mas_equalTo(0.5);
    }];
    xianView.backgroundColor=_LightGrey;
    
    _shengView=[UIView new];
    [_view addSubview:_shengView];
    [_shengView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(xianView);
        make.width.centerX.mas_equalTo(_shengLabel);
        make.height.mas_equalTo(1.8);
    }];
    _shengView.backgroundColor=_backgroundColor;
    
    _scrollView=[UIScrollView new];
    [_view addSubview:_scrollView];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(xianView.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    _scrollView.scrollsToTop = NO;
    _scrollView.showsVerticalScrollIndicator = FALSE;
    _scrollView.showsHorizontalScrollIndicator = FALSE;
    _scrollView.bounces = NO;
    _scrollView.contentSize = CGSizeMake(0, _mainH*0.6-75);
    _scrollView.pagingEnabled=YES;
    [self GetShengArr];
    
}
-(void)GetShengArr{
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:@"0",@"id", nil];
    [ZQTools AFNPostDataUrl:@"api/index/area_list" Dict:dic andTableView:nil andView:self andSuccessBlock:^(id responseObject) {
        _shengArr=responseObject;
        [self creatShengView];
        
    } anderrorBlock:nil];
    
}

-(void)creatShengView{
    self.shengLabelArr=[NSMutableArray arrayWithCapacity:0];
     self.shengViewArr=[NSMutableArray arrayWithCapacity:0];
    
    _shengView2=[UIScrollView new];
    [_scrollView addSubview:_shengView2];
    [_shengView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(0);
        make.width.mas_equalTo(_mainW);
        make.height.mas_equalTo(_mainH*0.6-75);
    }];
    _shengView2.scrollsToTop = NO;
    _shengView2.showsVerticalScrollIndicator = FALSE;
    _shengView2.showsHorizontalScrollIndicator = FALSE;
    _shengView2.bounces = NO;
    _shengView2.contentSize = CGSizeMake(0, _shengArr.count*35);
    
    for (int i=0; i<_shengArr.count; i++) {
        NSDictionary *dic=_shengArr[i];
        UIView *shengView=[UIView new];
        [_shengView2 addSubview:shengView];
        [shengView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(i*35);
            make.left.mas_equalTo(0);
            make.width.mas_equalTo(_mainW);
            make.height.mas_equalTo(35);
        }];
        [_shengViewArr addObject:shengView];
        shengView.tag=i;
        shengView.userInteractionEnabled=YES;
        UITapGestureRecognizer *selectShengFen = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectSheng:)];
        [shengView addGestureRecognizer:selectShengFen];
         
        UILabel *shengLabel=[UILabel new];
        [shengView addSubview:shengLabel];
        [shengLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.centerY.mas_equalTo(0);
        }];
        shengLabel.text=[dic objectForKey:@"name"];
        shengLabel.font=[UIFont systemFontOfSize:12];
        [_shengLabelArr addObject:shengLabel];
    }
    
}


-(void)selectSheng:(UITapGestureRecognizer *)tap{
    
    if (_row==1) {
        NSDictionary *dic=_shengArr[tap.view.tag];
        _customSelectedBlock(dic);
        [self removeFromSuperview];
        return;
    }
    _selectShengArr=_shengViewArr[tap.view.tag];
    _selectShengArr2=_shengLabelArr[tap.view.tag];
    for (int i=0; i<_shengLabelArr.count; i++) {
        UILabel *label=_shengLabelArr[i];
        if (_selectShengArr2==_shengLabelArr[i]) {
            label.textColor=_backgroundColor;
            [_imageView1 removeFromSuperview];
            _imageView1 =[UIImageView new];
            UIView *view=_shengViewArr[i];
            [view addSubview:_imageView1];
            [_imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(0);
                make.width.height.mas_equalTo(10);
                make.left.mas_equalTo(label.mas_right).mas_equalTo(5);
            }];
            _imageView1.backgroundColor=_backgroundColor;

        }
        else{
            label.textColor=[UIColor blackColor];
        }
        
    }
    if (tap.view.tag*35>(_mainH*0.6-75)/2) {
          _shengView2.contentOffset=CGPointMake(0, tap.view.tag*35-(_mainH*0.6-75)/2);
    }
    
    _scrollView.contentSize = CGSizeMake(_mainW*2, _mainH*0.6-75);
    _scrollView.contentOffset=CGPointMake(_mainW, 0);
    NSDictionary *dic=_shengArr[tap.view.tag];
    _shengLabel.text=[dic objectForKey:@"name"];
    _shengLabel.textColor=ColorWithRGB(79, 79, 79);
    _shengView.hidden=YES;
    
    [_shiLabel removeFromSuperview];
    [_shiView removeFromSuperview];
    [_xianLabel removeFromSuperview];
    [_xianView removeFromSuperview];
    
    _shiLabel=[UILabel new];
    [_view addSubview:_shiLabel];
    [_shiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_shengLabel.mas_right).mas_equalTo(15);
        make.centerY.mas_equalTo(_shengLabel);
    }];
    _shiLabel.text=@"请选择";
    _shiLabel.font=[UIFont systemFontOfSize:14];
    _shiLabel.textColor=_backgroundColor;
    _shiLabel.tag=1;
    _shiLabel.userInteractionEnabled=YES;
    UITapGestureRecognizer *selectDianJi = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dianJi:)];
    [_shiLabel addGestureRecognizer:selectDianJi];
    
    _shiView=[UIView new];
    [_view addSubview:_shiView];
    [_shiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(_shengView);
        make.width.centerX.mas_equalTo(_shiLabel);
        make.height.mas_equalTo(1.8);
    }];
    _shiView.backgroundColor=_backgroundColor;
    
    
    
    [self GetShiArr:(int)tap.view.tag];
    
}

-(void)GetShiArr:(int )abc{
    NSDictionary *typeDic=_shengArr[abc];
    NSNumber *ids=[typeDic objectForKey:@"id"];
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%@",ids],@"id", nil];
    [ZQTools AFNPostDataUrl:@"api/index/area_list" Dict:dic andTableView:nil andView:self andSuccessBlock:^(id responseObject) {
        _shiArr=responseObject;
        [self creatShiView:abc];
        
    } anderrorBlock:nil];
    
}
-(void)creatShiView:(int )abc{
    [_shiView2 removeFromSuperview];
    
  
    
    self.shiViewArr=[NSMutableArray arrayWithCapacity:0];
    self.shiLabelArr=[NSMutableArray arrayWithCapacity:0];

    _shiView2=[UIScrollView new];
    [_scrollView addSubview:_shiView2];
    [_shiView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(_mainW);
        make.width.mas_equalTo(_mainW);
        make.height.mas_equalTo(_mainH*0.6-75);
    }];
    _shiView2.scrollsToTop = NO;
    _shiView2.showsVerticalScrollIndicator = FALSE;
    _shiView2.showsHorizontalScrollIndicator = FALSE;
    _shiView2.bounces = NO;
    _shiView2.contentSize = CGSizeMake(_mainW, _shiArr.count*35);
    
    for (int i=0; i<_shiArr.count; i++) {
        NSDictionary *dic=_shiArr[i];
        UIView *shengView=[UIView new];
        [_shiView2 addSubview:shengView];
        [shengView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(i*35);
            make.left.mas_equalTo(0);
            make.width.mas_equalTo(_mainW);
            make.height.mas_equalTo(35);
        }];
        [_shiViewArr addObject:shengView];
        shengView.tag=i;
        shengView.userInteractionEnabled=YES;
        UITapGestureRecognizer *selectShengFen = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectShi:)];
        [shengView addGestureRecognizer:selectShengFen];
        
        UILabel *shengLabel=[UILabel new];
        [shengView addSubview:shengLabel];
        [shengLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.centerY.mas_equalTo(0);
        }];
        shengLabel.text=[dic objectForKey:@"name"];
        shengLabel.font=[UIFont systemFontOfSize:12];
        [_shiLabelArr addObject:shengLabel];
    }
    
}



-(void)selectShi:(UITapGestureRecognizer *)tap{
    if (_row==2) {
        NSDictionary *dic=_shiArr[tap.view.tag];
        _customSelectedBlock(dic);
        [self removeFromSuperview];
        return;
    }
    
    _selectShiArr=_shiViewArr[tap.view.tag];
    _selectShiArr2=_shiLabelArr[tap.view.tag];
    
    for (int i=0; i<_shiLabelArr.count; i++) {
        UILabel *label=_shiLabelArr[i];
        if (_selectShiArr2==_shiLabelArr[i]) {
            label.textColor=_backgroundColor;
            
            [_imageView2 removeFromSuperview];
            _imageView2 =[UIImageView new];
            UIView *view=_shiViewArr[i];
            [view addSubview:_imageView2];
            [_imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(0);
                make.width.height.mas_equalTo(10);
                make.left.mas_equalTo(label.mas_right).mas_equalTo(5);
            }];
            _imageView2.backgroundColor=_backgroundColor;
            
        }
        else{
            label.textColor=[UIColor blackColor];
        }
        
    }
    if (tap.view.tag*35>(_mainH*0.6-75)/2) {
        _shiView2.contentOffset=CGPointMake(0, tap.view.tag*35-(_mainH*0.6-75)/2);
    }
    
    _scrollView.contentSize = CGSizeMake(_mainW*3, _mainH*0.6-75);
    _scrollView.contentOffset=CGPointMake(_mainW*2, 0);
    
    [_xianLabel removeFromSuperview];
    [_xianView removeFromSuperview];
    
    NSDictionary *dic=_shiArr[tap.view.tag];
    _shiLabel.text=[dic objectForKey:@"name"];
    _shiLabel.textColor=ColorWithRGB(79, 79, 79);
    _shiView.hidden=YES;
    
    _xianLabel=[UILabel new];
    [_view addSubview:_xianLabel];
    [_xianLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_shiLabel.mas_right).mas_equalTo(15);
        make.centerY.mas_equalTo(_shengLabel);
    }];
    _xianLabel.text=@"请选择";
    _xianLabel.font=[UIFont systemFontOfSize:14];
    _xianLabel.textColor=_backgroundColor;
    _xianLabel.tag=2;
    _xianLabel.userInteractionEnabled=YES;
    UITapGestureRecognizer *selectDianJi = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dianJi:)];
    [_xianLabel addGestureRecognizer:selectDianJi];
    
    _xianView=[UIView new];
    [_view addSubview:_xianView];
    [_xianView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(_shengView);
        make.width.centerX.mas_equalTo(_xianLabel);
        make.height.mas_equalTo(1.8);
    }];
    _xianView.backgroundColor=_backgroundColor;

    
    [self GetQuArr:(int)tap.view.tag];
}

-(void)GetQuArr:(int )abc{
    NSDictionary *typeDic=_shiArr[abc];
    NSNumber *ids=[typeDic objectForKey:@"id"];
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%@",ids],@"id", nil];
    [ZQTools AFNPostDataUrl:@"api/index/area_list" Dict:dic andTableView:nil andView:self andSuccessBlock:^(id responseObject) {
        _xianArr=responseObject;
        [self creatXianView:abc];
        
    } anderrorBlock:nil];
    
}

-(void)creatXianView:(int )abc{
    [_xianView2 removeFromSuperview];
    
    
    self.xianViewArr=[NSMutableArray arrayWithCapacity:0];
    self.xianLabelArr=[NSMutableArray arrayWithCapacity:0];
    
    _xianView2=[UIScrollView new];
    [_scrollView addSubview:_xianView2];
    [_xianView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(_mainW*2);
        make.width.mas_equalTo(_mainW);
        make.height.mas_equalTo(_mainH*0.6-75);
    }];
    _xianView2.scrollsToTop = NO;
    _xianView2.showsVerticalScrollIndicator = FALSE;
    _xianView2.showsHorizontalScrollIndicator = FALSE;
    _xianView2.bounces = NO;
    _xianView2.contentSize = CGSizeMake(_mainW, _xianArr.count*35);
    
    
    for (int i=0; i<_xianArr.count; i++) {
        NSDictionary *dic=_xianArr[i];
        UIView *shengView=[UIView new];
        [_xianView2 addSubview:shengView];
        [shengView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(i*35);
            make.left.mas_equalTo(0);
            make.width.mas_equalTo(_mainW);
            make.height.mas_equalTo(35);
        }];
        [_xianViewArr addObject:shengView];
        shengView.tag=i;
        shengView.userInteractionEnabled=YES;
        UITapGestureRecognizer *selectShengFen = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectXian:)];
        [shengView addGestureRecognizer:selectShengFen];
        
        UILabel *shengLabel=[UILabel new];
        [shengView addSubview:shengLabel];
        [shengLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.centerY.mas_equalTo(0);
        }];
        shengLabel.text=[dic objectForKey:@"name"];
        shengLabel.font=[UIFont systemFontOfSize:12];
        [_xianLabelArr addObject:shengLabel];
    }
    
}

-(void)selectXian:(UITapGestureRecognizer *)tap{
    
    if (_row==3) {
        NSDictionary *dic=_xianArr[tap.view.tag];
        _customSelectedBlock(dic);
        [self removeFromSuperview];
        return;
    }
    _selectXianArr=_xianViewArr[tap.view.tag];
    _selectXianArr2=_xianLabelArr[tap.view.tag];
    
    for (int i=0; i<_xianLabelArr.count; i++) {
        UILabel *label=_xianLabelArr[i];
        if (_selectXianArr2==_xianLabelArr[i]) {
            label.textColor=_backgroundColor;
            
            [_imageView3 removeFromSuperview];
            _imageView3 =[UIImageView new];
            UIView *view=_xianViewArr[i];
            [view addSubview:_imageView3];
            [_imageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(0);
                make.width.height.mas_equalTo(10);
                make.left.mas_equalTo(label.mas_right).mas_equalTo(5);
            }];
            _imageView3.backgroundColor=_backgroundColor;
            
        }
        else{
            label.textColor=[UIColor blackColor];
        }
        
    }
    if (tap.view.tag*35>(_mainH*0.6-75)/2) {
        _xianView2.contentOffset=CGPointMake(0, tap.view.tag*35-(_mainH*0.6-75)/2);
    }
}

-(void)dianJi:(UITapGestureRecognizer *)tap{
    _scrollView.contentOffset=CGPointMake(_mainW*tap.view.tag, 0);
}

-(void)tuiChuView:(UITapGestureRecognizer *)tap{
    [self removeFromSuperview];

}


@end
