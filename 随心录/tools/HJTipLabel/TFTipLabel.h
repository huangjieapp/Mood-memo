//
//  TFTipLabel.h
//  test
//
//  Created by wubocheng on 16/4/25.
//  Copyright © 2016年 吴伯程. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TFTipLabel : UILabel

/** 在某个视图中弹出提示框 */
+ (instancetype)loadTipWithContent:(NSString *)content InView:(UIView *)view;
/** 简版 直接显示在window上 */
+ (void)loadTipWithContent:(NSString *)content;
/* 密码提示专用 */
+ (void)loadPasswordTip;

@end
