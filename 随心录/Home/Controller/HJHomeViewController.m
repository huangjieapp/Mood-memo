//
//  HJHomeViewController.m
//  随心录
//
//  Created by Hjie on 2017/4/13.
//  Copyright © 2017年 Hjie. All rights reserved.
//

#import "HJHomeViewController.h"
#import "HJWriteViewController.h"
#import "HJFmdb.h"
@interface HJHomeViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray *notesArray;
@property (nonatomic, strong) UITableView *tableview;
@end

@implementation HJHomeViewController

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[self readNotes];
	if (self.tableview) {
		[self.tableview reloadData];
	}
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kBackgroundColor;
    self.title = @"随心录";
    UIButton *rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    [rightButton setImage:[UIImage imageNamed:@"0-21"] forState:UIControlStateNormal];
    rightButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    UIBarButtonItem *rightEditButton = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightEditButton;
    
    UIButton *leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 15, 15)];
    [leftButton setImage:[UIImage imageNamed:@"2"] forState:UIControlStateNormal];
    leftButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
	[leftButton addTarget:self action:@selector(writeNotes:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftAddButton = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftAddButton;
	[self initUI];
}

- (void)readNotes {
	self.notesArray = [NSMutableArray array];
	FMDatabase *database = [HJFmdb shareFmdb];
	if ([database open]) {
		FMResultSet *set = [database executeQuery:@"select name from NOTE"];
		while ([set next]) {
			NSMutableDictionary *dic = [NSMutableDictionary dictionary];
			dic[@"name"] = [set stringForColumnIndex:0];
			[self.notesArray addObject:dic];
		}
	}
	[database close];
}

- (void)initUI {
	self.tableview = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
	[self.view addSubview:self.tableview];
	self.tableview.dataSource = self;
	self.tableview.delegate = self;
}

#pragma - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.notesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"noteCell"];;
	if (!cell) {
		cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"noteCell"];
	}
	cell.textLabel.text = self.notesArray[indexPath.row][@"name"];
	cell.textLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
	return cell;
}

#pragma - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	HJWriteViewController *writeVC = [HJWriteViewController new];
	writeVC.nameStr = self.notesArray[indexPath.row][@"name"];
	[self.navigationController pushViewController:writeVC animated:YES];
}

#pragma writeNotes
- (void)writeNotes:(UIButton *)sender {
	[self.navigationController pushViewController:[HJWriteViewController new] animated:YES];
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
