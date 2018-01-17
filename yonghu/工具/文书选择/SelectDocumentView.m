//
//  SelectDocumentView.m
//  yonghu
//
//  Created by 浪尖渝力 on 2018/1/17.
//  Copyright © 2018年 com.DJS. All rights reserved.
//

#import "SelectDocumentView.h"

@implementation SelectDocumentView
-(void)creatView{
    self.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    
    _index=1;
    UIView *view=[UIView new];
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.width.mas_equalTo(_mainW*0.7);
        make.height.mas_equalTo(_mainH*0.6);
    }];
    view.backgroundColor=[UIColor whiteColor];
    view.layer.cornerRadius=4;
    
    UIView *topView=[UIView new];
    [view addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(55);
    }];
    topView.backgroundColor=_backgroundColor;
    
    UIImageView *iamge=[UIImageView new];
    [topView addSubview:iamge];
    [iamge mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.centerY.mas_equalTo(0);
        make.width.mas_equalTo(12);
        make.height.mas_equalTo(20);
    }];
    iamge.image=[UIImage imageNamed:@"返回1"];
    iamge.userInteractionEnabled=YES;
    UITapGestureRecognizer *tuiChuView = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tuiChuView:)];
    [iamge addGestureRecognizer:tuiChuView];
    
    UILabel *titleLabel=[UILabel new];
    [topView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
    }];
    titleLabel.text=@"文书类型";
    titleLabel.font=[UIFont systemFontOfSize:18];
    titleLabel.textColor=[UIColor whiteColor];
    
    _tableView=[BaseTableView new];
    [view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.mas_equalTo(topView.mas_bottom);
    }];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:@"0",@"document_type", nil];
    [ZQTools AFNPostDataUrl:@"user/Document/type_list" Dict:dic andTableView:nil andView:self andSuccessBlock:^(id responseObject) {
        _tableArr=responseObject;
        [_tableView reloadData];
    } anderrorBlock:nil];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return _tableArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary *Dic=_tableArr[indexPath.row];
    static NSString *indentify = @"ReportCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentify];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentify];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.textAlignment = NSTextAlignmentCenter;//文字居中
    cell.textLabel.text = [Dic objectForKey:@"dt_name"];
    cell.textLabel.textColor=ColorWithRGB(49, 49, 49);
    cell.textLabel.font=[UIFont systemFontOfSize:20];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView reloadData];
    
    NSDictionary *typeDic=_tableArr[indexPath.row];
    _customSelectedBlock(typeDic);
    [self removeFromSuperview];
//    NSNumber *ids=[typeDic objectForKey:@"ct_id"];
//    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%@",ids],@"ct_id", nil];
//    [ZQTools AFNPostDataUrl:@"api/index/case_type" Dict:dic andTableView:nil andView:self andSuccessBlock:^(id responseObject) {
//        _tableArr=responseObject;
//        _index+=1;
//        [tableView reloadData];
//    } anderrorBlock:nil];
}

-(void)tuiChuView:(UITapGestureRecognizer *)tap{
    [self removeFromSuperview];
    
}


@end
