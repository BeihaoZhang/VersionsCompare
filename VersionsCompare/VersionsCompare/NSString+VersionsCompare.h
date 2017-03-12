//
//  NSString+VersionsCompare.h
//  VersionsCompare
//
//  Created by 张倍浩 on 2017/3/12.
//  Copyright © 2017年 张倍浩. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, VersionCompareType) {
    VersionCompareTypeError,
    VersionCompareTypeEqual,
    VersionCompareTypeLess,
    VersionCompareTypeGreater
};

@interface NSString (VersionsCompare)

- (BOOL)isRightVersion;

+ (VersionCompareType)version:(NSString *)v1 isGreaterThan:(NSString *)v2;

@end
