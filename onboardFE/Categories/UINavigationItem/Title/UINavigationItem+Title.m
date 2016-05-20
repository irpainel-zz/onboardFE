//
//  UINavigationItem+Title.m
//  
//
//  Created by Taqtile on 8/13/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "UINavigationItem+Title.h"
#import "TQTStylesheets.h"

@implementation UINavigationItem (Title)

-(void)setTitleWithDefaultStyleAndText:(NSString *)title{
    UILabel * titleLabel = [[UILabel alloc] init];
    [titleLabel setText:title];
    [[TQTStylesheets sharedInstance] setStyle:@"H1_Label" forView:titleLabel];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [titleLabel sizeToFit];
    [self setTitleView:titleLabel];
}

@end
