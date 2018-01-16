//
//  selectRegionView.h
//  anFang
//
//  Created by tangtangchitangtang on 2017/9/11.
//  Copyright © 2017年 tangtangchitangtang. All rights reserved.
//

#import "BaseView.h"

typedef void(^CustomSelectBlock)(NSDictionary *dic);

@interface selectRegionView : BaseView
{
    NSString *selectedProvince ;
}
@property(nonatomic,strong)UILabel *shengLabel,*shiLabel,*xianLabel,*quLabel;
@property(nonatomic,strong)UIView *shengView,*shiView,*xianView,*quViwe;
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)NSArray *shengArr,*shiArr,*xianArr,*quArr;
@property(nonatomic,strong)NSArray *selectShengArr,*selectShiArr,*selectXianArr,*selectQuArr;
@property(nonatomic,strong)NSArray *selectShengArr2,*selectShiArr2,*selectXianArr2,*selectQuArr2;
@property(nonatomic,strong)NSMutableArray *shengLabelArr,*shiLabelArr,*xianLabelArr,*quLabelArr;
@property(nonatomic,strong)NSMutableArray *shengViewArr,*shiViewArr,*xianViewArr,*quViewArr;
@property(nonatomic,strong) NSDictionary* dic2;
@property (nonatomic, assign) NSInteger row;
@property(nonatomic,strong)UIScrollView *shengView2,*shiView2,*xianView2;
@property(nonatomic,strong)UIImageView *imageView1,*imageView2,*imageView3;
@property(nonatomic,strong)UIView *view;
@property (nonatomic, copy) CustomSelectBlock customSelectedBlock;


@end
