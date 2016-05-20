//
//  NSNumber+BrazilFormat.m
//  
//
//  Created by Taqtile on 9/3/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "NSNumber+BrazilFormat.h"

@implementation NSNumber (BrazilFormat)

- (NSString *)brazilFormat {
    NSString *formattedString = [self descriptionWithLocale:[NSLocale localeWithLocaleIdentifier:@"pt_BR"]];
    return formattedString;
}

@end
