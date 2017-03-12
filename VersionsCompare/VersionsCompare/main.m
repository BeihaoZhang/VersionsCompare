//
//  main.m
//  VersionsCompare
//
//  Created by 张倍浩 on 2017/3/12.
//  Copyright © 2017年 张倍浩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+VersionsCompare.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        [@"11.0" isRightVersion];
//        [@"1.12.32.2.0.0" isRightVersion];
//        [@"2.3.4.1" isRightVersion];
//        
//        [@"-2." isRightVersion];
//        [@"-2.3.1" isRightVersion];
//        [@"2.-3.1" isRightVersion];
//        [@"ni" isRightVersion];
//        
//        BOOL v1 = [@"12.e3.3" isRightVersion];
//        NSLog(@"v1 = %d", v1);
//
//        BOOL v2 = [@".23" isRightVersion];
//        NSLog(@"v2 = %d", v2);
//
//        BOOL v3 = [@"1.2.34." isRightVersion];
//        NSLog(@"v3 = %d", v3);
//        NSString *str;
//        BOOL v4 = [str isRightVersion];
//        NSLog(@"v4 = %d", v4);
        
        VersionCompareType c1 = [NSString version:@"1+.1" isGreaterThan:@"1.1"];

        VersionCompareType c2 = [NSString version:@"11.1" isGreaterThan:@"1.2"];

        VersionCompareType c3 = [NSString version:@"01.1.01.10.01" isGreaterThan:@"01.1.01.10.01"];
        
        
    }
    return 0;
}
