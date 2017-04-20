//
//  HJNavigationBarRightPopView.m
//  随心录
//
//  Created by Hjie on 17/4/14.
//  Copyright © 2017年 Hjie. All rights reserved.
//

#import "HJNavigationBarRightPopView.h"
#import "AppDelegate.h"
@interface HJNavigationBarRightPopView ()

@property (strong, nonatomic) NSArray *buttonArray;

@property (weak, nonatomic) UINavigationController *navi;

@end
@implementation HJNavigationBarRightPopView

////- (NSArray *)buttonArray {
////    if (!_buttonArray) {
////        _buttonArray = @[@{ @"name" : @"我的收藏",
////                            @"class" : [MainViewController class] },
////                         @{ @"name" : @"通知",
////                            @"class" : [NotificationViewController class] },
////                         @{ @"name" : @"搜索",
////                            @"class" : [SearchViewController class] },
////                         @{ @"name" : @"设置",
////                            @"class" : [SettingViewController class] }
////                         ];
////    }
////    return _buttonArray;
////}
//
//- (instancetype)initWithNavigationViewController:(UINavigationController *)navi {
//    if (self = [super init]) {
//        //        _viewControllers = viewControllers;
//        _navi = navi;
//        
//        self.frame = [UIScreen mainScreen].bounds;
//        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
//        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeMenuView)];
//        [self addGestureRecognizer:recognizer];
//        
//        UIView *menuView = [[UIView alloc] init];
//        menuView.backgroundColor = [UIColor colorWithRed:31/255.0 green:33/255.0 blue:40/255.0 alpha:1];
//        
//        [self addSubview:menuView];
//        
//        int i = -1;
//        int j = 0;
//        
//        CGFloat height = 0;
//        
//        for (NSDictionary *buttonDic in self.buttonArray) {
//            i++;
//            if ([buttonDic[@"name"] isEqualToString:@"设置"]) { //我的收藏
//                if (_navi.viewControllers.lastObject.class != [MainViewController class]) {
//                    continue;
//                }
//            } else {
//                if (_navi.viewControllers.lastObject.class == buttonDic[@"class"]) {
//                    continue;
//                }
//            }
//            
//            height += 64;
//            
//            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//            button.frame = CGRectMake(0, 64 * j, 133, 64);
//            button.titleLabel.font = kFontBody;
//            button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//            button.tag = i;
//            button.contentEdgeInsets = UIEdgeInsetsMake(0, 25, 0, 0);
//            
//            [button addTarget:self action:@selector(menuSelect:) forControlEvents:UIControlEventTouchUpInside];
//            [button setTitle:self.buttonArray[i][@"name"] forState:UIControlStateNormal];
//            [menuView addSubview:button];
//            j++;
//        }
//        
//        menuView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 133, 0, 133, height);
//        
//        for (int i = 1; i < j; i++) {
//            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 64 * i, 133, 1)];
//            view.backgroundColor = [UIColor colorWithRed:26/255.0 green:28/255.0 blue:33/255.0 alpha:1];
//            [menuView addSubview:view];
//        }
//    }
//    return self;
//}
//
//- (void)closeMenuView {
//    self.hidden = YES;
//}
//
//- (void)menuSelect: (UIButton *)sender {
//    
//    
//    if (sender.tag == 0) {
//        AppDelegate* appdelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
//        [appdelegate.window.rootViewController removeFromParentViewController];
//        MainViewController *mainController = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
//        mainController.comeFromCollect = YES;
//        appdelegate.window.rootViewController =  [[TFNavigationController alloc] initWithRootViewController:mainController];
//    } else if (sender.tag == 1) {
//        [_navi pushViewController:[[NotificationViewController alloc] init] animated:YES];
//        
//    } else if (sender.tag == 2) {
//        
//        [_navi pushViewController:[[SearchViewController alloc] init] animated:YES];
//        
//    }else{
//        [_navi pushViewController:[[SettingViewController alloc] init] animated:YES];
//    }
//    self.hidden = YES;
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
