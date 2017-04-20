//
//  TFTipLabel.m
//  test
//
//  Created by wubocheng on 16/4/25.
//  Copyright © 2016年 吴伯程. All rights reserved.
//

#import "TFTipLabel.h"
#import "AppDelegate.h"

@implementation TFTipLabel

- (void)dealloc {
    //MYLog(@"%s", __func__);
}

+ (instancetype)loadTipWithContent:(NSString *)content InView:(UIView *)view {
    TFTipLabel *tipLabel = [self new];
    tipLabel.backgroundColor = [UIColor blackColor];
    tipLabel.text = content;
    tipLabel.textColor = [UIColor whiteColor];
    tipLabel.textAlignment = NSTextAlignmentCenter;
    tipLabel.layer.cornerRadius = 8;
    tipLabel.layer.masksToBounds = YES;
    tipLabel.alpha = 0.0;
    tipLabel.center = view.center;
    tipLabel.numberOfLines = 0;
    [view addSubview:tipLabel];
    CGSize tipLabelSize = [tipLabel sizeThatFits:CGSizeMake(150, FLT_MAX)];
    tipLabel.bounds = CGRectMake(0, 0, 150, tipLabelSize.height + 20);
    //动画
    [UIView animateWithDuration:1.5 animations:^{
        tipLabel.alpha = 1.0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.5 animations:^{
            tipLabel.alpha = 0.0;
        } completion:^(BOOL finished) {
            [tipLabel removeFromSuperview];
        }];
    }];
    return tipLabel;
}

+ (void)loadTipWithContent:(NSString *)content {
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    TFTipLabel *tipLabel = [self new];
    tipLabel.backgroundColor = [UIColor blackColor];
    tipLabel.text = content;
    tipLabel.textColor = [UIColor whiteColor];
    tipLabel.textAlignment = NSTextAlignmentCenter;
    tipLabel.layer.cornerRadius = 8;
    tipLabel.layer.masksToBounds = YES;
    tipLabel.alpha = 0.0;
    tipLabel.center = app.window.center;
    tipLabel.numberOfLines = 0;
    [app.window addSubview:tipLabel];
    CGSize tipLabelSize = [tipLabel sizeThatFits:CGSizeMake(200, FLT_MAX)];
    tipLabel.bounds = CGRectMake(0, 0, 200, tipLabelSize.height + 20);
    //动画
    [UIView animateWithDuration:1.5 animations:^{
        tipLabel.alpha = 1.0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.5 animations:^{
            tipLabel.alpha = 0.0;
        } completion:^(BOOL finished) {
            [tipLabel removeFromSuperview];
        }];
    }];
}

+ (void)loadPasswordTip {
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    TFTipLabel *tipLabel = [self new];
    tipLabel.backgroundColor = [UIColor blackColor];
    tipLabel.text = @"密码必须包含大小写英文字母和数字\n,长度须在8位-20位\n,不允许的特殊符号 *＊ #＃&=＝%％!！\\<>/／";
    tipLabel.textColor = [UIColor whiteColor];
    tipLabel.textAlignment = NSTextAlignmentCenter;
    tipLabel.layer.cornerRadius = 8;
    tipLabel.layer.masksToBounds = YES;
    tipLabel.alpha = 0.0;
    tipLabel.center = app.window.center;
    tipLabel.numberOfLines = 0;
    [app.window addSubview:tipLabel];
    CGSize tipLabelSize = [tipLabel sizeThatFits:CGSizeMake(200, FLT_MAX)];
    tipLabel.bounds = CGRectMake(0, 0, 200, tipLabelSize.height + 20);
    //动画
    [UIView animateWithDuration:1.5 animations:^{
        tipLabel.alpha = 1.0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.5 animations:^{
            tipLabel.alpha = 0.0;
        } completion:^(BOOL finished) {
            [tipLabel removeFromSuperview];
        }];
    }];
}

@end
