//
//  HJLoginViewController.m
//  随心录
//
//  Created by Hjie on 2017/4/13.
//  Copyright © 2017年 Hjie. All rights reserved.
//

#import "HJLoginViewController.h"
#import "UIView+HJView.h"
#import "HJHomeViewController.h"
#import "HJPlistManager.h"
@interface HJLoginViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) UITextField *userTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@end

@implementation HJLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	NSLog(@"%f",self.view.bounds.size.width);
	[self initUI];
}

- (void)initUI {
	[self.view backgroundImage];
	//用户名
	//标题
	UILabel *titleLabel = [[UILabel alloc]init];
	[self.view addSubview:titleLabel];
	titleLabel.text = @"用户登录";
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
	passwordView.alpha = 0.7;
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
		make.bottom.mas_offset(-20);
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
	//登录按钮
	UIButton *loginBtn = [[UIButton alloc]init];
	[self.view addSubview:loginBtn];
	[loginBtn setTitle:@"登录" forState:UIControlStateNormal];
	[loginBtn setBackgroundColor:kButtonBlue3Color];
	[loginBtn addTarget:self action:@selector(loginBtnAction:) forControlEvents:UIControlEventTouchUpInside];
	loginBtn.clipsToBounds = YES;
	loginBtn.layer.cornerRadius = 5;
	[loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.mas_equalTo(passwordView.mas_bottom).mas_equalTo(25);
		make.left.mas_equalTo(passwordView.mas_left);
		make.width.mas_equalTo(passwordView.mas_width);
		make.height.mas_equalTo(45);
	}];
	//忘记密码按钮
	UIButton *forgetBtn = [[UIButton alloc]init];
	[self.view addSubview:forgetBtn];
	[forgetBtn setTitle:@"忘记密码>>" forState:UIControlStateNormal];
	[forgetBtn setTitleColor:kButtonBlue3Color forState:UIControlStateNormal];
	[forgetBtn addTarget:self action:@selector(forgetBtnAction:) forControlEvents:UIControlEventTouchUpInside];
	[forgetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.mas_equalTo(loginBtn.mas_bottom).mas_equalTo(25);
		make.right.mas_equalTo(-30);
		make.height.mas_equalTo(20);
	}];
	
}

#pragma 登录按钮事件
- (void)loginBtnAction:(UIButton *)sender {
    HJPlistManager *plistManager = [[HJPlistManager alloc]init];
    NSDictionary *dic = [NSDictionary dictionary];
    dic = [plistManager readPlistData];
    if ([dic[@"userName"] isEqualToString:self.userTextField.text] && [dic[@"passWord"] isEqualToString:self.passwordTextField.text]) {
        UINavigationController *naviVC = [[UINavigationController alloc]initWithRootViewController:[HJHomeViewController new]];
        [self presentViewController:naviVC animated:YES completion:nil];
    } else {
        [TFTipLabel loadTipWithContent:@"用户名或密码错误"];
    }
}

#pragma 忘记密码按钮事件
- (void)forgetBtnAction:(UIButton *)sender {
    
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
