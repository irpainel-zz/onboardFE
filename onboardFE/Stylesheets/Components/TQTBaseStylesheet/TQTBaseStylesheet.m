//
//  TQTBaseStylesheet.m
//  onboardFE
//
//  Created by Tqt iOS on 5/20/2016.
//  Copyright (c) 2016 Taqtile. All rights reserved.
//

#import "TQTBaseStylesheet.h"
#import "TQTStylesheetsProperties.h"
#import "Fonts.h"
#import "UIImage+ImageWithColor.h"

@implementation TQTBaseStylesheet
+ (NSDictionary *)stylesheet {
    return @{
             @"UIButton": @{
                     PK_BUTTON_LABEL_FONT: [UIFont fontWithName:FONT_NAME(FONT_FAMILY_PRIMARY, FONT_WEIGHT_REGULAR) size:FONT_SIZE_SMALL],
                     PK_BUTTON_TYPE: [NSNumber numberWithInt:UIButtonTypeCustom],
                    },
             };
}
@end
