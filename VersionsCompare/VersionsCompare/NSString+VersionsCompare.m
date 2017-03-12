//
//  NSString+VersionsCompare.m
//  VersionsCompare
//
//  Created by 张倍浩 on 2017/3/12.
//  Copyright © 2017年 张倍浩. All rights reserved.
//

#import "NSString+VersionsCompare.h"

@implementation NSString (VersionsCompare)

+ (VersionCompareType)version:(NSString *)v1 isGreaterThan:(NSString *)v2 {
    if (![v1 isRightVersion] || ![v2 isRightVersion]) {
        return VersionCompareTypeError;
    }
    
    NSArray *v1Array = [v1 componentsSeparatedByString:@"."];
    NSArray *v2Array = [v2 componentsSeparatedByString:@"."];
    
    NSUInteger v1Count = v1Array.count;
    NSUInteger v2Count = v2Array.count;
    
    NSInteger count = MIN(v1Count, v2Count);
    VersionCompareType compareType = VersionCompareTypeEqual;
    for (int i = 0; i < count; i++) {
        NSString *item1 = v1Array[i];
        NSString *item2 = v2Array[i];
        if (item1 > item2) {
            compareType = VersionCompareTypeGreater;
            break;
        } else if (item1 < item2) {
            compareType = VersionCompareTypeLess;
            break;
        }
    }
    
    if (v1Count == v2Count ||
        compareType == VersionCompareTypeGreater ||
        compareType == VersionCompareTypeLess) {
        return compareType;
    }
    
    // if condictions don't match above, the temp value of compareType is VersionCompareTypeEqual.
    //    compareType = VersionCompareTypeEqual;
    if (v1Count > count) {
        for (NSUInteger i = count; i < v1Count; i++) {
            NSString *item = v1Array[i];
            if ([item integerValue] > 0) {
                compareType = VersionCompareTypeGreater;
                break;
            }
        }
    } else {
        for (NSUInteger i = count; v2Count; i++) {
            NSString *item = v2Array[i];
            if ([item integerValue] > 0) {
                compareType = VersionCompareTypeLess;
                break;
            }
        }
    }
    return compareType;
}

- (BOOL)isRightVersion{
    // this condition can't match the regex, don't need to judge.
    //    if (self == nil) return NO;

    //    NSString *regex = @"^([0-9]+[.]){1,}[0-9]{1,}$";
    NSString *regex = @"^(\\d+[.])+\\d+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [predicate evaluateWithObject:self];
    return isMatch;
}

@end
