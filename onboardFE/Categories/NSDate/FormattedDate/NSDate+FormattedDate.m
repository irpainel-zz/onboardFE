//
//  NSDate+FormattedDate.m
//  
//
//  Created by Taqtile on 10/6/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "NSDate+FormattedDate.h"

@implementation NSDate (FormattedDate)

+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:year];
    [components setMonth:month];
    [components setDay:day];
    return [calendar dateFromComponents:components];
}

@end
