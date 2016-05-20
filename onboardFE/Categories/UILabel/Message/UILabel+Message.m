//
//  UILabel+Message.m
//  
//
//  Created by Taqtile on 8/12/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "UILabel+Message.h"
#import "Message.h"


IB_DESIGNABLE
@implementation UILabel (Message)

-(NSString *)messageKey
{
    return @"";
}

-(void)setMessageKey:(NSString *)messageKey
{
    self.text = [Message messageWithKey:messageKey];
}

@end
