//
//  NSString+DynamicSize.h
//  
//
//  Created by Taqtile on 8/19/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (DynamicSize)

-(CGFloat)heightForFont:(UIFont*)font withinWidth:(CGFloat)width;
-(CGFloat)widthForFont:(UIFont*)font;
@end
