//
//  UIButton+Message.m
//  
//
//  Created by Taqtile on 8/12/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "UIButton+Message.h"
#import "Message.h"

@implementation UIButton (Message)

-(NSString *)messageKey
{
    return @"";
}

-(void)setMessageKey:(NSString *)messageKey
{
    [self setTitle:[Message messageWithKey:messageKey] forState:UIControlStateNormal];
}

@end
