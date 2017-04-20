//
//  HJSaveNoteData.h
//  随心录
//
//  Created by Hjie on 2017/4/18.
//  Copyright © 2017年 Hjie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HJSaveNoteData : NSObject
+ (void)createFile:(NSString *)str andContent:(NSString *)content;
+ (NSString *)readFile:(NSString *)str;
+ (void)deleteFile:(NSString *)str;
@end
