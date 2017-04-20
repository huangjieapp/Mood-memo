//
//  HJPlistManager.h
//  随心录
//
//  Created by Hjie on 17/4/14.
//  Copyright © 2017年 Hjie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HJPlistManager : NSObject
- (void)writePlist:(NSDictionary *)plistName;
- (NSDictionary *)readPlistData;
@end
