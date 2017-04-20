//
//  HJFmdb.h
//  随心录
//
//  Created by Hjie on 2017/4/18.
//  Copyright © 2017年 Hjie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"

@interface HJFmdb : NSObject
- (void)createDB;
+ (FMDatabase *)shareFmdb;
+ (void)cancelSingleton;
@end
