//
//  HJSaveNoteData.m
//  随心录
//
//  Created by Hjie on 2017/4/18.
//  Copyright © 2017年 Hjie. All rights reserved.
//

#import "HJSaveNoteData.h"

@implementation HJSaveNoteData

+ (void)createFile:(NSString *)str andContent:(NSString *)content {
	NSFileManager *fileManager = [NSFileManager defaultManager];//单例模式
	NSString *pathString = [[kDocumentPath stringByAppendingPathComponent:@"Notes"] stringByAppendingPathComponent:[str stringByAppendingString:@".txt"]];
	//判断路径下文件是否存在
	if ([fileManager fileExistsAtPath:pathString]) {
		return;
	}
	NSError *error = nil;
	if ([fileManager createDirectoryAtPath:[pathString stringByDeletingLastPathComponent] withIntermediateDirectories:YES attributes:nil error:&error]) {
		[fileManager createFileAtPath:pathString contents:nil attributes:nil];
	}
	
	[content writeToFile:pathString atomically:NO encoding:NSUTF8StringEncoding error:&error];
}

+ (NSString *)readFile:(NSString *)str {
	NSFileManager *fileManager = [NSFileManager defaultManager];//单例模式
	NSString *pathString = [[kDocumentPath stringByAppendingPathComponent:@"Notes"] stringByAppendingPathComponent:[str stringByAppendingString:@".txt"]];
	//判断路径下文件是否存在
	NSString *contentStr = nil;
	if ([fileManager fileExistsAtPath:pathString]) {
		NSError *error = nil;
		contentStr = [NSString stringWithContentsOfFile:pathString encoding:NSUTF8StringEncoding error:&error];
		
	}
	return contentStr;
}
+ (void)deleteFile:(NSString *)str {
	NSFileManager *fileManager = [NSFileManager defaultManager];//单例模式
	NSString *pathString = [[kDocumentPath stringByAppendingPathComponent:@"Notes"] stringByAppendingPathComponent:[str stringByAppendingString:@".txt"]];
	if ([fileManager fileExistsAtPath:pathString]) {
		NSError *error = nil;
		[fileManager removeItemAtPath:pathString error:&error];
		
	}
}
@end
