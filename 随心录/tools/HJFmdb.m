//
//  HJFmdb.m
//  随心录
//
//  Created by Hjie on 2017/4/18.
//  Copyright © 2017年 Hjie. All rights reserved.
//

#import "HJFmdb.h"
#import <sqlite3.h>
@interface HJFmdb (){
	sqlite3 *db;
}
@end
static FMDatabase *database = nil;
@implementation HJFmdb
- (void)createDB {
	NSString *dbPath = [[kDocumentPath stringByAppendingPathComponent:@"Notes"] stringByAppendingPathComponent:@"note.db"];
	if ([[NSFileManager defaultManager] fileExistsAtPath:dbPath]) {
		return;
	} else {
		NSError *error = nil;
		if ([[NSFileManager defaultManager] createDirectoryAtPath:[dbPath stringByDeletingLastPathComponent] withIntermediateDirectories:YES attributes:nil error:&error]) {
			[[NSFileManager defaultManager] createFileAtPath:dbPath contents:nil attributes:nil];
		}
		
	}
	
	if (sqlite3_open([dbPath UTF8String], &db) != SQLITE_OK) {
		sqlite3_close(db);
		NSLog(@"数据库打开失败");
	}
	NSString *sqlCreateTable = @"CREATE TABLE IF NOT EXISTS NOTE (ID INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT)";
	[self execSql:sqlCreateTable];
	
}

-(void)execSql:(NSString *)sql
{
	char *err;
	if (sqlite3_exec(db, [sql UTF8String], NULL, NULL, &err) != SQLITE_OK) {
		sqlite3_close(db);
		NSLog(@"数据库操作数据失败!");
	}
}

+ (void)cancelSingleton {
	database = nil;
}

+ (FMDatabase *)shareFmdb {
	NSString *noteDB = [[kDocumentPath stringByAppendingPathComponent:@"Notes"] stringByAppendingPathComponent:@"note.db"];
	//容错性判断
	if (![[NSFileManager defaultManager] fileExistsAtPath:noteDB]) {
		return nil;
	}
	if (!database) {
		database = [FMDatabase databaseWithPath:noteDB];
	}
	[database close];
	return database;
}
@end
