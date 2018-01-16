//
//  ReleaseCaseView.h
//  yonghu
//
//  Created by 浪尖渝力 on 2018/1/15.
//  Copyright © 2018年 com.DJS. All rights reserved.
//

#import "BaseView.h"

@interface ReleaseCaseView : BaseView<UITextFieldDelegate>
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UITextField *nameText;
@property(nonatomic,strong)UILabel *addLabel;
@property(nonatomic,strong)NSDictionary *caseDic;
@property(nonatomic,strong)UIView *bottomView;

@end
