//
//  Utils.m
//  JustTest
//
//  Created by bj_dongyun on 2017/6/23.
//  Copyright © 2017年 just play. All rights reserved.
//

#import "Utils.h"

@implementation Utils
//屏幕翻转
+ (void)forceOrientation: (UIInterfaceOrientation)orientation {
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        SEL selector = NSSelectorFromString(@"setOrientation:");
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget: [UIDevice currentDevice]];
        int val = orientation;
        [invocation setArgument:&val atIndex:2];
        [invocation invoke];
    }
}
//是否横屏
+ (BOOL)isOrientationLandscape {
    if (UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        return YES;
    } else {
        return NO;
    }
}
#pragma mark -得到当前时间
+ (NSDate *)getCurrentTime{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd-MM-yyyy-HHmmss"];
    NSString *dateTime=[formatter stringFromDate:[NSDate date]];
    NSDate *date = [formatter dateFromString:dateTime];
    
//    NSLog(@"---------- currentDate == %@",date);
    return date;
}
+ (NSDate*)getTargetTime{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy-HHmmss"];
    NSDate *date = [dateFormatter dateFromString:@"26-08-2017-000000"];
    return date;
}
+ (int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy-HHmmss"];
    NSString *oneDayStr = [dateFormatter stringFromDate:oneDay];
    NSString *anotherDayStr = [dateFormatter stringFromDate:anotherDay];
    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    NSComparisonResult result = [dateA compare:dateB];
//    NSLog(@"date1 : %@, date2 : %@", oneDay, anotherDay);
    if (result == NSOrderedDescending) {
        //NSLog(@"Date1  is in the future");
        return 1;
    }
    else if (result == NSOrderedAscending){
        //NSLog(@"Date1 is in the past");
        return -1;
    }
    //NSLog(@"Both dates are the same");
    return 0;
    
}
+(BOOL)isDis{
    int num = [self compareOneDay:[self getCurrentTime] withAnotherDay:[self getTargetTime]];
    if (num == 1) {
        return YES;
    }else{
        return NO;
    }
}
+(void)replaceVC:(UIViewController*)targetVC{
    [UIApplication sharedApplication].keyWindow.rootViewController = targetVC;
}
@end
