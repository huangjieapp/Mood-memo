//
//  HJStartViewController.m
//  随心录
//
//  Created by Hjie on 2017/4/13.
//  Copyright © 2017年 Hjie. All rights reserved.
//

#import "HJStartViewController.h"
#import "HJHomeViewController.h"
#import "HJPlistManager.h"
@interface HJStartViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) UITextField *userTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UITextField *trueTextField;
@property (nonatomic, strong) NSMutableDictionary *dic;
@end

@implementation HJStartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = kBackgroundColor;
	[self initUI];
}

- (NSMutableDictionary *)dic {
    if (!_dic) {
        _dic = [NSMutableDictionary dictionary];
    }
    return _dic;
}

- (void)initUI {
	
	//标题
	UILabel *titleLabel = [[UILabel alloc]init];
	[self.view addSubview:titleLabel];
	titleLabel.text = @"设置密码";
	[titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.mas_equalTo(64);
		make.centerX.mas_equalTo(0);
		make.height.mas_equalTo(30);
	}];
	//密码框
	UIView *passwordView = [[UIView alloc]init];
	[self.view addSubview:passwordView];
	passwordView.clipsToBounds = YES;
	passwordView.layer.cornerRadius = 5;
	passwordView.backgroundColor = [UIColor whiteColor];
	[passwordView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.mas_equalTo(titleLabel.mas_bottom).mas_equalTo(50);
		make.left.mas_equalTo(25);
		make.right.mas_equalTo(-25);
	}];
	//用户名
	UILabel *userLabel = [[UILabel alloc]init];
	[passwordView addSubview:userLabel];
	userLabel.text = @"用  户  名:";
	[userLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.mas_equalTo(20);
		make.left.mas_equalTo(20);
		make.width.mas_equalTo(80);
	}];
	
	UITextField *userTextField = [[UITextField alloc]init];
	self.userTextField = userTextField;
	[passwordView addSubview:userTextField];
	userTextField.placeholder = @"请输入用户名";
	userTextField.borderStyle = UITextBorderStyleRoundedRect;
	[userTextField mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.mas_equalTo(userLabel.mas_right).mas_equalTo(10);
		make.centerY.mas_equalTo(userLabel.mas_centerY);
		make.right.mas_equalTo(-10);
	}];
	//密码
	UILabel *passwordLabel = [[UILabel alloc]init];
	[passwordView addSubview:passwordLabel];
	passwordLabel.text = @"密        码:";
	[passwordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.mas_equalTo(userLabel.mas_bottom).mas_equalTo(21);
		make.left.mas_equalTo(userLabel.mas_left);
		make.width.mas_equalTo(80);
	}];
	
	UITextField *passwordTextField = [[UITextField alloc]init];
	self.passwordTextField = passwordTextField;
	[passwordView addSubview:passwordTextField];
	passwordTextField.placeholder = @"请输入密码";
	passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
	[passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.mas_equalTo(passwordLabel.mas_right).mas_equalTo(10);
		make.centerY.mas_equalTo(passwordLabel.mas_centerY);
		
		make.right.mas_equalTo(-10);
	}];
	//确认密码
	UILabel *trueLabel = [[UILabel alloc]init];
	[passwordView addSubview:trueLabel];
	trueLabel.text = @"确认密码:";
	[trueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.mas_equalTo(passwordLabel.mas_bottom).mas_equalTo(21);
		make.left.mas_equalTo(passwordLabel.mas_left);
		make.bottom.mas_equalTo(-20);
		make.width.mas_equalTo(80);
	}];
	
	UITextField *trueTextField = [[UITextField alloc]init];
	self.trueTextField = trueTextField;
	[passwordView addSubview:trueTextField];
	trueTextField.placeholder = @"请确认密码";
	trueTextField.borderStyle = UITextBorderStyleRoundedRect;
	[trueTextField mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.mas_equalTo(trueLabel.mas_right).mas_equalTo(10);
		make.centerY.mas_equalTo(trueLabel.mas_centerY);
		make.right.mas_equalTo(-10);
	}];
	
	//确定按钮
	UIButton *yesBtn = [[UIButton alloc]init];
	[self.view addSubview:yesBtn];
	[yesBtn setTitle:@"确定" forState:UIControlStateNormal];
	[yesBtn setBackgroundColor:kButtonBlue3Color];
	[yesBtn addTarget:self action:@selector(yesBtnAction:) forControlEvents:UIControlEventTouchUpInside];
	yesBtn.clipsToBounds = YES;
	yesBtn.layer.cornerRadius = 5;
	[yesBtn mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.mas_equalTo(passwordView.mas_bottom).mas_equalTo(25);
		make.left.mas_equalTo(passwordView.mas_left);
		make.width.mas_equalTo(passwordView.mas_width);
		make.height.mas_equalTo(45);
	}];
	//跳过按钮
	UIButton *passBtn = [[UIButton alloc]init];
	[self.view addSubview:passBtn];
	[passBtn setTitle:@"跳过>>" forState:UIControlStateNormal];
	[passBtn setTitleColor:kButtonBlue3Color forState:UIControlStateNormal];
	[passBtn addTarget:self action:@selector(passBtnAction:) forControlEvents:UIControlEventTouchUpInside];
	[passBtn mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.mas_equalTo(yesBtn.mas_bottom).mas_equalTo(25);
		make.right.mas_equalTo(-30);
		make.height.mas_equalTo(20);
	}];
	
	userTextField.delegate = passwordTextField.delegate = trueTextField.delegate = self;
}


#pragma 确定按钮事件
- (void)yesBtnAction:(UIButton *)sender {
	if ([self.userTextField.text isEqualToString:@""]) {
		[TFTipLabel loadTipWithContent:@"用户名不能为空"];
		return;
	}
	if ([self.passwordTextField.text isEqualToString:@""]) {
		[TFTipLabel loadTipWithContent:@"密码不能为空"];
		return;
	}
	if ([self.trueTextField.text isEqualToString:@""]) {
		[TFTipLabel loadTipWithContent:@"确认密码不能为空"];
		return;
	}
	if ([self.passwordTextField.text isEqualToString:self.trueTextField.text]) {
		[[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"passBtn"];
        HJPlistManager *plistManager = [[HJPlistManager alloc]init];
        self.dic[@"userName"] = self.userTextField.text;
        self.dic[@"passWord"] = self.passwordTextField.text;
        [plistManager writePlist:self.dic];
        UINavigationController *naviVC = [[UINavigationController alloc]initWithRootViewController:[HJHomeViewController new]];
		[self presentViewController:naviVC animated:YES completion:nil];
	} else {
		[TFTipLabel loadTipWithContent:@"两次密码不匹配"];
		return;
	}
	
}

#pragma 跳过按钮事件
- (void)passBtnAction:(UIButton *)sender {
	[[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"passBtn"];
	[self presentViewController:[HJHomeViewController new] animated:YES completion:nil];
}

#pragma UITxteFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
	if ([string isEqualToString:@" "]) {
		return NO;
	}
	return YES;
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
