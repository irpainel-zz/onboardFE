//
//  NSString+Clean.m
//  
//
//  Created by Taqtile on 8/13/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "NSString+Clean.h"

@implementation NSString (Clean)

-(NSString*) stringWithOnlyNumbers
{
    NSArray *chars = [self charArray];
    NSMutableString* resultString = [NSMutableString new];
    for (NSString *c in chars) {
        if([c isNumber]) [resultString appendString:c];
    }
    return resultString;
}

-(NSString*) withMask:(NSString*) mask
{
    NSMutableString* resultString = [NSMutableString new];
    int maskIndex = 0;
    int stringIndex = 0;
    NSArray* chars = [self charArray];
    NSArray* maskChars = [mask charArray];

    while (stringIndex < chars.count && maskIndex < maskChars.count) {
        if([maskChars[maskIndex] isEqualToString:@"#"]){
            [resultString appendString:chars[stringIndex]];
            stringIndex++;
        } else{
            [resultString appendString:maskChars[maskIndex]];
        }
        maskIndex++;
    }

    return resultString;
}

-(NSString*) appendString:(NSString*) string atIndex:(NSRange) index
{
    NSMutableString* stringResult = [NSMutableString new];
    NSArray* chars = [self charArray];
    if(self.length <= index.location){
        return [NSString stringWithFormat:@"%@%@", self, string];
    }
    for(int i=0; i<chars.count; i++) {
        NSString* c = chars[i];
        if(i == index.location) {
            [stringResult appendString:string];
        }
        [stringResult appendString:c];
    }
    return stringResult;
}

-(NSArray*) charArray
{
    NSMutableArray *chars = [NSMutableArray array];
    for (int i = 0; i < [self length]; i++) {
        [chars addObject:[NSString stringWithFormat:@"%C", [self characterAtIndex:i]]];
    }
    return chars;
}

-(BOOL) isNumber {
    return [self rangeOfCharacterFromSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]].location == NSNotFound;
}

-(NSString*)stringByReturningFirstWord {
    return [[self  componentsSeparatedByString:@" "] objectAtIndex:0];
}

@end
