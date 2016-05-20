//
//  PlaceholderStylesheet.m
//  
//
//  Created by Taqtile on 8/7/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "PlaceholderStylesheet.h"
#import "TQTStylesheetImports.h"

@implementation PlaceholderStylesheet
+ (NSDictionary *)stylesheet {
    return @{
             @"Placeholder_Default_View": @{
                     PK_VIEW_BACKGROUND_COLOR: UICOLOR_FROM_HEX(COLOR_WHITE),
                     },
             @"Placeholder_Default_Label": @{
                     PK_LABEL_FONT: [UIFont fontWithName:FONT_NAME(FONT_FAMILY_PRIMARY, FONT_WEIGHT_REGULAR) size:FONT_SIZE_LARGE],
                     PK_LABEL_TEXT_COLOR: UICOLOR_FROM_HEX(COLOR_GRAY_DARKEST),
                     },
             };
}

@end
