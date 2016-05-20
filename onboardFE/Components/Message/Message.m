//
//  Message.m
//  
//
//  Created by Taqtile on 8/14/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//


#import "Message.h"
#import "Constants.h"

@implementation Message

+(NSString *)messageWithKey: (NSString *)key {
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *message = NSLocalizedStringFromTableInBundle(key, @"Messages", bundle, nil);
    
    return message;
}

@end