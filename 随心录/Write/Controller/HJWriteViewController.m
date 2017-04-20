//
//  HJWriteViewController.m
//  随心录
//
//  Created by Hjie on 2017/4/18.
//  Copyright © 2017年 Hjie. All rights reserved.
//

#import "HJWriteViewController.h"
#import "HJSaveNoteData.h"
#import "HJFmdb.h"
@interface HJWriteViewController ()<UITextViewDelegate> {
}
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) NSString *dateString;
@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation HJWriteViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
	[self.view endEditing:YES];
}

- (void)viewWillAppear:(BOOL)animated {
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShow:) name:UIKeyboardWillShowNotification object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
	self.title = @"心物语";
	[self initUI];
	
}

- (void)initUI {
	UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 45, 10)];
	[backBtn setTitle:@"< 返回" forState:UIControlStateNormal];
	backBtn.titleLabel.font = [UIFont systemFontOfSize:14];
	[backBtn setTitleColor:kButtonBlue3Color forState:UIControlStateNormal];
	[backBtn addTarget:self action:@selector(backHomeVC:) forControlEvents:UIControlEventTouchUpInside];
	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
	
//	UIButton *saveBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 10)];
//	[saveBtn setTitle:@"保存" forState:UIControlStateNormal];
//	[saveBtn setTitleColor:kButtonBlue3Color forState:UIControlStateNormal];
//	[saveBtn addTarget:self action:@selector(saveNotes:) forControlEvents:UIControlEventTouchUpInside];
//	saveBtn.titleLabel.font = [UIFont systemFontOfSize:14];
//	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:saveBtn];
	UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake( 20, 64 + 20, 60, 30 )];
	self.titleLabel = titleLabel;
	titleLabel.numberOfLines = 0;
	titleLabel.text = @"心语:";
	titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
//	titleLabel.backgroundColor = [UIColor blueColor];
	titleLabel.frame = [titleLabel textRectForBounds:titleLabel.frame limitedToNumberOfLines:titleLabel.numberOfLines];
	[self.view addSubview:titleLabel];
	
	
	UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(titleLabel.frame)+20, self.view.bounds.size.width - 20, self.view.bounds.size.height - 64-64-60)];
	self.textView = textView;
//	textView.backgroundColor = [UIColor redColor];
	textView.delegate = self;
	textView.font = [UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
	[self.view addSubview:textView];
	if (self.nameStr) {
		textView.text = [HJSaveNoteData readFile:self.nameStr];
	} else {
		textView.text = @"加大了巨大老师就打了就打了建档立卡时间段里拿出和内存空间的那是空间从南非进口发大水了附近垃圾是加大了巨大老师就打了就打了建档立卡时间段里拿出和内存空间的那是空间从南非进口发大水了附近垃圾是加大了巨大老师就打了就打了建档立卡时间段里拿出和内存空间的那是空间从南";
	}
	
	
	UILabel *dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height - 60, self.view.frame.size.width, 60)];
	NSDate *date = [NSDate date];
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];//创建时间格式对象
	dateFormatter.dateFormat = @"yyyy年MM月dd日 HH:mm:ss";
	NSString *time = [dateFormatter stringFromDate:date];
	NSLog(@"time = %@",time);
	dateLabel.text = self.nameStr ? self.nameStr : time;
	dateLabel.textAlignment = NSTextAlignmentCenter;
	[self.view addSubview:dateLabel];
	self.dateString = dateLabel.text;
	
	UIButton *delBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width - 30, CGRectGetMidY(dateLabel.frame), 20, 20)];
	[delBtn setBackgroundImage:[UIImage imageNamed:@"0-58"] forState:UIControlStateNormal];
	[delBtn addTarget:self action:@selector(delNote:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:delBtn];
	
	UIButton *shareBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, CGRectGetMidY(dateLabel.frame), 20, 20)];
	[shareBtn setBackgroundImage:[UIImage imageNamed:@"0"] forState:UIControlStateNormal];
	[self.view addSubview:shareBtn];
	delBtn.contentMode = shareBtn.contentMode = UIViewContentModeScaleAspectFit;
}

#pragma backHomeVC 
- (void)backHomeVC:(UIButton *)sender {
	if (self.nameStr) {
		[HJSaveNoteData deleteFile:self.nameStr];
		[HJSaveNoteData createFile:self.nameStr andContent:self.textView.text];
	} else {
		[HJSaveNoteData createFile:self.dateString andContent:self.textView.text];
		FMDatabase *database = [HJFmdb shareFmdb];
		if ([database open]) {
			[database executeUpdate:@"insert into NOTE(name) values (?)",self.dateString];
		}
		[database close];
	}
	
	
	[self.navigationController popViewControllerAnimated:YES];
}

#pragma saveNotes
//- (void)saveNotes:(UIButton *)sender {
//	[HJSaveNoteData createFile:self.dateString andContent:self.textView.text];
//	FMDatabase *database = [HJFmdb shareFmdb];
//	if ([database open]) {
//		[database executeUpdate:@"insert into NOTE(name) values (?)",self.dateString];
//	}
//	[database close];
//	[self.navigationController popViewControllerAnimated:YES];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma - UITextViewDelegate
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString*)text
{
	if ([text isEqualToString:@"\n"]) {
		[textView resignFirstResponder];//return键收回键盘
		return NO;
	}
	return YES;
}

#pragma - deleteNote
- (void)delNote:(UIButton *)sender {
	FMDatabase *database = [HJFmdb shareFmdb];
	if ([database open]) {
		[database executeUpdate:@"delete from NOTE where name = ?",self.nameStr];
	}
	[database close];
	[HJSaveNoteData deleteFile:self.nameStr];
	[self.navigationController popViewControllerAnimated:YES];
}

#pragma - keyboard notification
- (void)keyboardShow:(NSNotification *)noti {
	CGRect endFrame = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
	float height = endFrame.size.height;
	// 读取键盘动画的时长和选项
	NSDictionary *dictionary = noti.userInfo;
	NSTimeInterval duration = [dictionary[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
	UIViewAnimationOptions options = [dictionary[UIKeyboardAnimationCurveUserInfoKey] intValue];
	
	[UIView animateWithDuration:duration delay:0 options:options animations:^{
		self.textView.frame = CGRectMake(0, CGRectGetMaxY(self.titleLabel.frame)+20, self.view.frame.size.width, self.view.frame.size.height - height);
	} completion:nil];
	
}

- (void)keyboardHide:(NSNotification *)noti {
	NSDictionary *dictionary = noti.userInfo;
	NSTimeInterval duration = [dictionary[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
	UIViewAnimationOptions options = [dictionary[UIKeyboardAnimationCurveUserInfoKey] intValue];
	[UIView animateWithDuration:duration delay:0 options:options animations:^{
		self.textView.frame = CGRectMake(0, CGRectGetMaxY(self.titleLabel.frame)+20, self.view.frame.size.width, self.view.frame.size.height - 60);
	} completion:nil];
	
}

- (void)dealloc {
	
}

@end
