//
//  TQTButtonStylesheet.m
//  onboardFE
//
//  Created by Tqt iOS on 5/20/2016.
//  Copyright (c) 2016 Taqtile. All rights reserved.
//

#import "TQTButtonStylesheet.h"
#import "UIImage+ImageWithColor.h"
#import "Colors.h"
#import "Fonts.h"
#import "TQTStylesheetsProperties.h"
#import "Components.h"

@implementation TQTButtonStylesheet
+ (NSDictionary *)stylesheet {
    return @{
             @"Primary_Button": @{
                     PK_BUTTON_NORMAL_TITLE_COLOR: UICOLOR_FROM_HEX(COLOR_WHITE),
                     PK_BUTTON_HIGHLIGHTED_TITLE_COLOR:UICOLOR_HIGHLIGHTED_FROM_HEX(COLOR_WHITE),
                     PK_BUTTON_DISABLED_TITLE_COLOR:UICOLOR_DISABLED_FROM_HEX(COLOR_WHITE),
                     PK_BUTTON_NORMAL_BACKGROUND_IMAGE: [UIImage imageWithColor: UICOLOR_FROM_HEX(COLOR_PRIMARY)],
                     PK_BUTTON_HIGHLIGHTED_BACKGROUND_IMAGE: [UIImage imageWithColor:UICOLOR_HIGHLIGHTED_FROM_HEX(COLOR_PRIMARY)],
                     PK_BUTTON_DISABLED_BACKGROUND_IMAGE: [UIImage imageWithColor:UICOLOR_DISABLED_FROM_HEX(COLOR_PRIMARY)],
                     PK_BUTTON_CORNER_RADIUS: @CORNER_RADIUS,
                     PK_BUTTON_MASKS_TO_BOUNDS: [NSNumber numberWithBool:YES],
                     },
             @"Alert_Button": @{
                     PK_BUTTON_NORMAL_TITLE_COLOR: UICOLOR_FROM_HEX(COLOR_WHITE),
                     PK_BUTTON_HIGHLIGHTED_TITLE_COLOR:UICOLOR_HIGHLIGHTED_FROM_HEX(COLOR_WHITE),
                     PK_BUTTON_DISABLED_TITLE_COLOR:UICOLOR_DISABLED_FROM_HEX(COLOR_WHITE),
                     PK_BUTTON_NORMAL_BACKGROUND_IMAGE: [UIImage imageWithColor: UICOLOR_FROM_HEX(COLOR_ALERT)],
                     PK_BUTTON_HIGHLIGHTED_BACKGROUND_IMAGE: [UIImage imageWithColor:UICOLOR_HIGHLIGHTED_FROM_HEX(COLOR_ALERT)],
                     PK_BUTTON_DISABLED_BACKGROUND_IMAGE: [UIImage imageWithColor: UICOLOR_DISABLED_FROM_HEX(COLOR_ALERT)],
                     PK_BUTTON_CORNER_RADIUS: @CORNER_RADIUS,
                     PK_BUTTON_MASKS_TO_BOUNDS: [NSNumber numberWithBool:YES],
                     },
             @"CallToAction_Button": @{
                     PK_BUTTON_NORMAL_TITLE_COLOR: UICOLOR_FROM_HEX(COLOR_WHITE),
                     PK_BUTTON_HIGHLIGHTED_TITLE_COLOR:UICOLOR_HIGHLIGHTED_FROM_HEX(COLOR_WHITE),
                     PK_BUTTON_DISABLED_TITLE_COLOR:UICOLOR_DISABLED_FROM_HEX(COLOR_WHITE),
                     PK_BUTTON_NORMAL_BACKGROUND_IMAGE: [UIImage imageWithColor: UICOLOR_FROM_HEX(COLOR_CALL_TO_ACTION)],
                     PK_BUTTON_HIGHLIGHTED_BACKGROUND_IMAGE: [UIImage imageWithColor:UICOLOR_HIGHLIGHTED_FROM_HEX(COLOR_CALL_TO_ACTION)],
                     PK_BUTTON_DISABLED_BACKGROUND_IMAGE: [UIImage imageWithColor:UICOLOR_DISABLED_FROM_HEX(COLOR_CALL_TO_ACTION)],
                     PK_BUTTON_CORNER_RADIUS: @CORNER_RADIUS,
                     PK_BUTTON_MASKS_TO_BOUNDS: [NSNumber numberWithBool:YES],
                     },
             @"Neutral_Button": @{
                     PK_BUTTON_NORMAL_TITLE_COLOR: UICOLOR_FROM_HEX(COLOR_GRAY),
                     PK_BUTTON_HIGHLIGHTED_TITLE_COLOR:UICOLOR_HIGHLIGHTED_FROM_HEX(COLOR_GRAY),
                     PK_BUTTON_DISABLED_TITLE_COLOR:UICOLOR_DISABLED_FROM_HEX(COLOR_GRAY),
                     PK_BUTTON_NORMAL_BACKGROUND_IMAGE: [UIImage imageWithColor: UICOLOR_FROM_HEX(COLOR_WHITE)],
                     PK_BUTTON_HIGHLIGHTED_BACKGROUND_IMAGE: [UIImage imageWithColor:UICOLOR_HIGHLIGHTED_FROM_HEX(COLOR_WHITE)],
                     PK_BUTTON_DISABLED_BACKGROUND_IMAGE: [UIImage imageWithColor:UICOLOR_DISABLED_FROM_HEX(COLOR_WHITE)],
                     PK_BUTTON_BORDER_COLOR: UICOLOR_FROM_HEX(COLOR_GRAY),
                     PK_BUTTON_BORDER_WIDTH: @BORDER_SMALL_WIDTH,
                     PK_BUTTON_CORNER_RADIUS: @CORNER_RADIUS,
                     PK_BUTTON_MASKS_TO_BOUNDS: [NSNumber numberWithBool:YES],
                     },
             @"AlertOutlined_Button": @{
                     PK_BUTTON_NORMAL_TITLE_COLOR: UICOLOR_FROM_HEX(COLOR_ALERT),
                     PK_BUTTON_HIGHLIGHTED_TITLE_COLOR:UICOLOR_HIGHLIGHTED_FROM_HEX(COLOR_ALERT),
                     PK_BUTTON_DISABLED_TITLE_COLOR:UICOLOR_DISABLED_FROM_HEX(COLOR_ALERT),
                     PK_BUTTON_NORMAL_BACKGROUND_IMAGE: [UIImage imageWithColor: UICOLOR_FROM_HEX(COLOR_WHITE)],
                     PK_BUTTON_HIGHLIGHTED_BACKGROUND_IMAGE: [UIImage imageWithColor:UICOLOR_HIGHLIGHTED_FROM_HEX(COLOR_WHITE)],
                     PK_BUTTON_DISABLED_BACKGROUND_IMAGE: [UIImage imageWithColor:UICOLOR_DISABLED_FROM_HEX(COLOR_WHITE)],
                     PK_BUTTON_BORDER_COLOR: UICOLOR_FROM_HEX(COLOR_ALERT),
                     PK_BUTTON_BORDER_WIDTH: @BORDER_SMALL_WIDTH,
                     PK_BUTTON_CORNER_RADIUS: @CORNER_RADIUS,
                     PK_BUTTON_MASKS_TO_BOUNDS: [NSNumber numberWithBool:YES],
                     },
             @"Link_Button": @{
                     PK_BUTTON_NORMAL_TITLE_COLOR: UICOLOR_FROM_HEX(COLOR_GRAY_DARKER),
                     PK_BUTTON_HIGHLIGHTED_TITLE_COLOR:UICOLOR_HIGHLIGHTED_FROM_HEX(COLOR_GRAY_DARKER),
                     PK_BUTTON_DISABLED_TITLE_COLOR:UICOLOR_DISABLED_FROM_HEX(COLOR_GRAY_DARKER),
                     PK_BUTTON_BORDER_COLOR: [UIColor clearColor],
                     PK_BUTTON_BORDER_WIDTH: @0,
                     }
             };
}

+ (NSDictionary *)attributedStringAttributes {
    return @{
             @"Navbar_Button_BarButton": @{
                     NSFontAttributeName: [UIFont fontWithName:FONT_NAME(FONT_FAMILY_PRIMARY, FONT_WEIGHT_REGULAR) size:FONT_SIZE_LARGE],
                     NSForegroundColorAttributeName: UICOLOR_FROM_HEX(COLOR_WHITE),
                     },
             };
}
@end
