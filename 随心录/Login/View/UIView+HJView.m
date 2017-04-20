//
//  UIView+HJView.m
//  随心录
//
//  Created by Hjie on 2017/4/13.
//  Copyright © 2017年 Hjie. All rights reserved.
//

#import "UIView+HJView.h"

@implementation UIView (HJView)

- (void)backgroundImage {
	UIImageView *bgImageView = [[UIImageView alloc]initWithFrame:self.frame];
	bgImageView.image = [UIImage imageNamed:@"bg.png"];
	[self addSubview:bgImageView];
}
@end
