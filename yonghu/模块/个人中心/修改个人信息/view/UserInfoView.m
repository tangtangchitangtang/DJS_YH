//
//  UserInfoView.m
//  yonghu
//
//  Created by 浪尖渝力 on 2018/1/15.
//  Copyright © 2018年 com.DJS. All rights reserved.
//

#import "UserInfoView.h"

@implementation UserInfoView

-(void)creatView{
    [self.viewController wr_setNavBarBackgroundAlpha:0];
    self.backgroundColor=_LightGrey;
    UIView *beiJingView=[UIView new];
    [self addSubview:beiJingView];
    [beiJingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(70);
        make.height.mas_equalTo(203);
    }];
    beiJingView.layer.cornerRadius=4;
    beiJingView.backgroundColor=[UIColor whiteColor];
    
    UIView *imgView=[UIView new];
    [beiJingView addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(50);
    }];
    
    
    UILabel *imgLabel=[UILabel new];
    [imgView addSubview:imgLabel];
    [imgLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
    }];
    imgLabel.text=@"头像";
    imgLabel.textColor=ColorWithRGB(49, 49,49);
    imgLabel.font=[UIFont systemFontOfSize:16];
    
    _imageView=[UIImageView new];
    [imgView addSubview:_imageView];
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
        make.width.height.mas_equalTo(40);
    }];
    _imageView.layer.masksToBounds=YES;
    _imageView.layer.cornerRadius=20;
    NSString *news_cover=[_dic objectForKey:@"user_icon"];
    news_cover=[NSString stringWithFormat:@"%@%@",_addressUrl,news_cover];
    [_imageView sd_setImageWithURL:[NSURL URLWithString:news_cover]];
    
    _imageView.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userIconChange)];
    [_imageView addGestureRecognizer:tapGesture];
    
    UIView *xianView=[UIView new];
    [beiJingView addSubview:xianView];
    [xianView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(imgView.mas_bottom);
        make.height.mas_equalTo(1);
    }];
     xianView.backgroundColor=_LightGrey;
    
    UIView *nameView=[UIView new];
    [beiJingView addSubview:nameView];
    [nameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(50);
        make.top.mas_equalTo(xianView.mas_bottom);
    }];
    
    UILabel *nameLabel=[UILabel new];
    [nameView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
    }];
    nameLabel.text=@"用户名";
    nameLabel.textColor=ColorWithRGB(49, 49, 49);
    nameLabel.font=[UIFont systemFontOfSize:16];
    
    _nameText=[UITextField new];
    [nameView addSubview:_nameText];
    [_nameText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(_mainW*0.6);
    }];
    NSString *user_nickname=[_dic objectForKey:@"user_nickname"];
    if ([ZQTools charIsNil:user_nickname]) {
        _nameText.placeholder=@"请输入昵称";
    }else{
        _nameText.text=user_nickname;
    }
    _nameText.textColor=ColorWithRGB(49, 49, 49);
    _nameText.font=[UIFont systemFontOfSize:16];
    [_nameText addTarget:self action:@selector(onEditing:) forControlEvents:UIControlEventEditingDidEnd];
    _nameText.delegate=self;
    _nameText.returnKeyType=UIReturnKeyDone;
    _nameText.textAlignment=NSTextAlignmentRight;
    
    UIView *xianView2=[UIView new];
    [beiJingView addSubview:xianView2];
    [xianView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(nameView.mas_bottom);
        make.height.mas_equalTo(1);
    }];
    xianView2.backgroundColor=_LightGrey;
    
    
    
    UIView *sexView=[UIView new];
    [beiJingView addSubview:sexView];
    [sexView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(50);
        make.top.mas_equalTo(xianView2.mas_bottom);
    }];
    
    UILabel *sexLabel3=[UILabel new];
    [sexView addSubview:sexLabel3];
    [sexLabel3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
    }];
    sexLabel3.text=@"性别";
    sexLabel3.textColor=ColorWithRGB(49, 49, 49);
    sexLabel3.font=[UIFont systemFontOfSize:16];
    
    UILabel *sexLabel=[UILabel new];
    [sexView addSubview:sexLabel];
    [sexLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
        make.width.mas_equalTo(20);
    }];
    sexLabel.text=@"女";
    sexLabel.font=[UIFont systemFontOfSize:16];
    sexLabel.textColor=ColorWithRGB(49, 49, 49);
    
    _sexIamge1=[UIImageView new];
    [sexView addSubview:_sexIamge1];
    [_sexIamge1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(sexLabel.mas_left).mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
        make.width.height.mas_equalTo(25);
    }];
    _sexIamge1.tag=0;
    _sexIamge1.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectSex:)];
    [_sexIamge1 addGestureRecognizer:tapGesture2];
    
    UILabel *sexLabel2=[UILabel new];
    [sexView addSubview:sexLabel2];
    [sexLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_sexIamge1.mas_left).mas_equalTo(-20);
        make.centerY.mas_equalTo(0);
        make.width.mas_equalTo(20);
    }];
    sexLabel2.text=@"男";
    sexLabel2.font=[UIFont systemFontOfSize:16];
    sexLabel2.textColor=ColorWithRGB(49, 49, 49);
    
    
    _sexIamge2=[UIImageView new];
    [sexView addSubview:_sexIamge2];
    [_sexIamge2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(sexLabel2.mas_left).mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
        make.width.height.mas_equalTo(25);
    }];
    _sexIamge2.userInteractionEnabled=YES;
    _sexIamge2.tag=1;
    UITapGestureRecognizer *tapGestur3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectSex:)];
    [_sexIamge2 addGestureRecognizer:tapGestur3];
    
    _sex=[[_dic objectForKey:@"user_sex"] intValue];
    if (_sex==0||_sex==2) {
        _sexIamge1.image=[UIImage imageNamed:@"是"];
        _sexIamge2.image=[UIImage imageNamed:@"否"];
    }
    else{
        _sexIamge2.image=[UIImage imageNamed:@"是"];
        _sexIamge1.image=[UIImage imageNamed:@"否"];
    }
    
    
    UIView *xianView3=[UIView new];
    [beiJingView addSubview:xianView3];
    [xianView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(sexView.mas_bottom);
        make.height.mas_equalTo(1);
    }];
    xianView3.backgroundColor=_LightGrey;
    
    UIView *phoneView=[UIView new];
    [beiJingView addSubview:phoneView];
    [phoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(50);
        make.top.mas_equalTo(xianView3.mas_bottom);
    }];
    
    UILabel *phoneLabel=[UILabel new];
    [phoneView addSubview:phoneLabel];
    [phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
    }];
    phoneLabel.text=@"手机号";
    phoneLabel.textColor=ColorWithRGB(49, 49, 49);
    phoneLabel.font=[UIFont systemFontOfSize:16];
    
    UILabel *phoneLabel2=[UILabel new];
    [phoneView addSubview:phoneLabel2];
    [phoneLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
    }];
    phoneLabel2.text=[_dic objectForKey:@"user_phone"];
    phoneLabel2.textColor=ColorWithRGB(49, 49, 49);
    phoneLabel2.font=[UIFont systemFontOfSize:16];
    
    UIButton *btn=[UIButton new];
    [self addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(beiJingView);
        make.top.mas_equalTo(beiJingView.mas_bottom).mas_equalTo(50);
        make.height.mas_equalTo(50);
    }];
    btn.layer.cornerRadius=5;
    btn.backgroundColor=_backgroundColor;
    [btn setTitle:@"提交" forState:0];
    [btn setTitleColor:[UIColor whiteColor] forState:0];
    [btn addTarget:self action:@selector(tiJiao:) forControlEvents:UIControlEventTouchUpInside];
 }

-(IBAction)tiJiao:(id)sender{
    NSString *token=[_dic objectForKey:@"token"];
    NSNumber *waiter_id1=[_dic objectForKey:@"user_id"];
    NSString *user_id=[NSString stringWithFormat:@"%@",waiter_id1];
    NSString *user_sex=[NSString stringWithFormat:@"%d",_sex];
    NSString *user_nickname=_nameText.text;
    
    _imagArr=[NSArray arrayWithObjects:_imageView.image, nil];
    
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:token,@"token",@"0",@"user_role",user_id,@"user_id",user_sex,@"user_sex",user_nickname,@"user_nickname", nil];
    
    [ZQTools afnPostImageWithDict:dic WithAddressUrl:@"user/user/edit_user" withImageArr:_imagArr withFileName:@"user_icon" WithView:self success:^(id responseObject) {
        [ZQTools svpInfo:@"修改成功"];
        [self.viewController.navigationController popViewControllerAnimated:YES];
    }];
    
}

-(void)selectSex:(UITapGestureRecognizer *)tap{
    _sex=(int)tap.view.tag;
    if (_sex==0||_sex==2) {
        _sexIamge1.image=[UIImage imageNamed:@"是"];
        _sexIamge2.image=[UIImage imageNamed:@"否"];
    }
    else{
        _sexIamge1.image=[UIImage imageNamed:@"否"];
        _sexIamge2.image=[UIImage imageNamed:@"是"];
       
    }
}


-(void) userIconChange{
    
    UIAlertController *actionSheetController = [UIAlertController alertControllerWithTitle: @"" message: @"拍照或从相册中选择" preferredStyle: UIAlertControllerStyleActionSheet];
    
    [actionSheetController addAction: [UIAlertAction actionWithTitle:@"打开相册"style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
        [self LocalPhoto];
        
    }]];
    [actionSheetController addAction: [UIAlertAction actionWithTitle: @"拍照" style: UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action) {
        [self locaXiangJi];
        
        
    }]];
    
    [actionSheetController addAction: [UIAlertAction actionWithTitle:@"取消"style:UIAlertActionStyleCancel handler:^(UIAlertAction *_Nonnull action) {}]];
    
    [self.viewController presentViewController: actionSheetController animated:YES completion:^{}];
    
}

-(void)locaXiangJi{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    
    UIImagePickerControllerQualityType qualityType = UIImagePickerControllerQualityTypeHigh;
    
    /*判断是否有相机*/
    
    if([UIImagePickerController isSourceTypeAvailable : UIImagePickerControllerSourceTypeCamera]){
        
        UIImagePickerController *picker = [[UIImagePickerController alloc]init];
        
        picker.delegate=self;
        
        /*设置拍照后的图片可被编辑*/
        
        picker.allowsEditing=YES;
        
        /*资源类型为照相机*/
        
        picker.sourceType= sourceType;
        
        /*品质为高*/
        
        picker.videoQuality= qualityType;
        
        [self.viewController presentViewController: picker animated:YES completion:^{
            
            
        }];
        
    }else{
        //        [self alertTitle:@"该设备无摄像头"];
        
    }
    
}
-(void)LocalPhoto
{
    
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    
    /*资源类型为图片库*/
    
    picker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    
    picker.delegate=self;
    
    /*设置选择后的图片可被编辑*/
    
    picker.allowsEditing=YES;
    
    [self.viewController presentViewController:picker animated:YES completion:^{
        
        
    }];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    [picker dismissViewControllerAnimated:YES completion:^{
        
        UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
        _imageView.image=image;
       
    }];
    
}

-(void)onEditing:(UITextField *)textField{
    if (textField.text.length > 15)
    {
        [ZQTools svpInfo:@"昵称不能超过15个字"];
        textField.text=[textField.text substringToIndex:15];
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
