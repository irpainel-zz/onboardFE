//
//  NSString+DynamicSize.m
//  
//
//  Created by Taqtile on 8/19/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "NSString+DynamicSize.h"

@implementation NSString (DynamicSize)

-(CGFloat)heightForFont:(UIFont*)font withinWidth:(CGFloat)width
{
    return [self boundingRectWithSize:CGSizeMake(width, 0)
                                  options:NSStringDrawingUsesLineFragmentOrigin
                               attributes:@{NSFontAttributeName:font}
                                  context:nil].size.height;
}

-(CGFloat)widthForFont:(UIFont*)font
{
    CGSize size = [self sizeWithAttributes:@{NSFontAttributeName:font}];
    return size.width+2;
}

@end
