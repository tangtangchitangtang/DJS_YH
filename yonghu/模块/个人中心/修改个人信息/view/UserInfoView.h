//
//  UserInfoView.h
//  yonghu
//
//  Created by 浪尖渝力 on 2018/1/15.
//  Copyright © 2018年 com.DJS. All rights reserved.
//

#import "BaseView.h"

@interface UserInfoView : BaseView<UITextFieldDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property(nonatomic,strong)UITextField *nameText;
@property(nonatomic,strong)NSDictionary *dic;
@property(nonatomic,assign)int sex;
@property(nonatomic,strong)UIImageView *sexIamge1,*sexIamge2,*imageView;
@property(nonatomic,strong)NSArray<UIImage *> *imagArr;
@end
