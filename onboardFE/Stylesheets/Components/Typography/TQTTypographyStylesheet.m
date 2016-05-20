//
//  TQTTypographyStylesheet.m
//  
//
//  Created by Taqtile on 11/25/15.
//  Copyright © 2015 Taqtile. All rights reserved.
//

#import "TQTTypographyStylesheet.h"
#import "TQTStylesheetImports.h"

@implementation TQTTypographyStylesheet
+ (NSDictionary *)stylesheet {
    return @{
             // Titles
             @"H1_Label": @{
                     PK_LABEL_FONT:[UIFont fontWithName:FONT_NAME(FONT_FAMILY_PRIMARY, FONT_WEIGHT_REGULAR) size:FONT_SIZE_EXTRA_LARGE],
                     PK_LABEL_TEXT_COLOR: UICOLOR_FROM_HEX(COLOR_WHITE),
                     },
             @"H2_Label": @{
                     PK_LABEL_FONT:[UIFont fontWithName:FONT_NAME(FONT_FAMILY_PRIMARY, FONT_WEIGHT_MEDIUM) size:FONT_SIZE_LARGE],
                     PK_LABEL_TEXT_COLOR: UICOLOR_FROM_HEX(COLOR_GRAY_DARKEST),
                     },
             @"H3_Label": @{
                     PK_LABEL_FONT:[UIFont fontWithName:FONT_NAME(FONT_FAMILY_PRIMARY, FONT_WEIGHT_REGULAR) size:FONT_SIZE_MEDIUM],
                     PK_LABEL_TEXT_COLOR: UICOLOR_FROM_HEX(COLOR_GRAY),
                     },
             @"H4_Label": @{
                     PK_LABEL_FONT:[UIFont fontWithName:FONT_NAME(FONT_FAMILY_PRIMARY, FONT_WEIGHT_REGULAR) size:FONT_SIZE_MEDIUM],
                     PK_LABEL_TEXT_COLOR: UICOLOR_FROM_HEX(COLOR_GRAY_DARKEST),
                     },
             @"H4_IsHighlighted_Label": @{
                     PK_LABEL_TEXT_COLOR: UICOLOR_HIGHLIGHTED_FROM_HEX(COLOR_GRAY_DARKEST),
                     },
             @"H4Sub_Label": @{
                     PK_LABEL_FONT:[UIFont fontWithName:FONT_NAME(FONT_FAMILY_PRIMARY, FONT_WEIGHT_LIGHT) size:FONT_SIZE_SMALL],
                     PK_LABEL_TEXT_COLOR: UICOLOR_FROM_HEX(COLOR_GRAY),
                     },
             @"H4Sub_IsHighlighted_Label": @{
                     PK_LABEL_TEXT_COLOR: UICOLOR_HIGHLIGHTED_FROM_HEX(COLOR_GRAY),
                     },
             @"H5_Label": @{
                     PK_LABEL_FONT:[UIFont fontWithName:FONT_NAME(FONT_FAMILY_PRIMARY, FONT_WEIGHT_REGULAR) size:FONT_SIZE_SMALL],
                     PK_LABEL_TEXT_COLOR: UICOLOR_FROM_HEX(COLOR_GRAY),
                     },

             // Body
             @"Body_Label": @{
                     PK_LABEL_FONT:[UIFont fontWithName:FONT_NAME(FONT_FAMILY_PRIMARY, FONT_WEIGHT_REGULAR) size:FONT_SIZE_SMALL],
                     PK_LABEL_TEXT_COLOR: UICOLOR_FROM_HEX(COLOR_GRAY_LIGHTER),
                     },

             // Caption
             @"Caption_Label": @{
                     PK_LABEL_FONT:[UIFont fontWithName:FONT_NAME(FONT_FAMILY_PRIMARY, FONT_WEIGHT_LIGHT) size:FONT_SIZE_EXTRA_SMALL],
                     PK_LABEL_TEXT_COLOR: UICOLOR_FROM_HEX(COLOR_GRAY),
                     },
             @"Caption_IsInactive_Label": @{
                     PK_LABEL_TEXT_COLOR: UICOLOR_DISABLED_FROM_HEX(COLOR_GRAY),
                     },
             @"Caption_IsError_Label": @{
                     PK_LABEL_TEXT_COLOR: UICOLOR_FROM_HEX(COLOR_ALERT),
                     },

             // Forms
             @"InputValue_TextField": @{
                     PK_TEXTFIELD_FONT:[UIFont fontWithName:FONT_NAME(FONT_FAMILY_PRIMARY, FONT_WEIGHT_REGULAR) size:FONT_SIZE_MEDIUM],
                     PK_TEXTFIELD_TINT_COLOR: UICOLOR_FROM_HEX(COLOR_GRAY_DARKEST),
                     PK_TEXTFIELD_TEXT_COLOR: UICOLOR_FROM_HEX(COLOR_GRAY_DARKEST),
                     },
             @"InputValue_IsError_TextField": @{
                     PK_TEXTFIELD_TINT_COLOR: UICOLOR_FROM_HEX(COLOR_ALERT),
                     PK_TEXTFIELD_TEXT_COLOR: UICOLOR_FROM_HEX(COLOR_ALERT),
                     },
             @"InputValue_IsInactive_TextField": @{
                     PK_TEXTFIELD_TINT_COLOR: UICOLOR_DISABLED_FROM_HEX(COLOR_GRAY_DARKEST),
                     PK_TEXTFIELD_TEXT_COLOR: UICOLOR_DISABLED_FROM_HEX(COLOR_GRAY_DARKEST)
                     },

             // Label
             @"Label_Label": @{
                     PK_LABEL_FONT:[UIFont fontWithName:FONT_NAME(FONT_FAMILY_PRIMARY, FONT_WEIGHT_REGULAR) size:FONT_SIZE_SMALL],
                     PK_LABEL_TEXT_COLOR: UICOLOR_FROM_HEX(COLOR_GRAY_DARKEST),
                    },
             @"Label_IsInactive_Label": @{
                     PK_LABEL_TEXT_COLOR: UICOLOR_DISABLED_FROM_HEX(COLOR_GRAY_DARKEST),
                    },
             @"Label_IsError_Label": @{
                     PK_LABEL_TEXT_COLOR: UICOLOR_FROM_HEX(COLOR_ALERT),
                    },
             };
}

+ (NSDictionary *)attributedStringAttributes {
    return @{
             // Forms
             @"InputPlaceholder": @{
                     NSFontAttributeName:[UIFont fontWithName:FONT_NAME(FONT_FAMILY_PRIMARY, FONT_WEIGHT_REGULAR) size:FONT_SIZE_LARGE],
                     NSForegroundColorAttributeName: UICOLOR_FROM_HEX(COLOR_GRAY),
                     },
             };
}
@end