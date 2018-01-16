//
//  SelectCaseView.h
//  yonghu
//
//  Created by 浪尖渝力 on 2018/1/16.
//  Copyright © 2018年 com.DJS. All rights reserved.
//

#import "BaseView.h"
typedef void(^CustomSelectBlock)(NSDictionary *dic);

@interface SelectCaseView : BaseView<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSArray *tableArr;
@property(nonatomic,strong)BaseTableView *tableView;
@property (nonatomic, copy) CustomSelectBlock customSelectedBlock;
@property(nonatomic,assign)int index,index2;
@end
