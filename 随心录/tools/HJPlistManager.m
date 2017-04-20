//
//  HJPlistManager.m
//  随心录
//
//  Created by Hjie on 17/4/14.
//  Copyright © 2017年 Hjie. All rights reserved.
//

#import "HJPlistManager.h"

@implementation HJPlistManager
- (NSString *)createPlist {
    //拼接plist文件
    NSString *plistPath = [kDocumentPath stringByAppendingPathComponent:@"dataPlist.plist"];
    return plistPath;
}

- (void)writePlist:(NSDictionary *)plistData {
    NSString *plistPath = [self createPlist];
    //创建数据路径
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //创建文件
    [fileManager createFileAtPath:plistPath contents:nil attributes:nil];
    [plistData writeToFile:plistPath atomically:YES];
    
}

- (NSDictionary *)readPlistData {
    NSString *plistPath = [self createPlist];
    NSDictionary *dataDic = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    return dataDic;
}
@end
