//
//  NotificationViewStylesheet.m
//  
//
//  Created by Taqtile on 11/29/15.
//  Copyright © 2015 Taqtile. All rights reserved.
//

#import "NotificationViewStylesheet.h"
#import "TQTStylesheetImports.h"

@implementation NotificationViewStylesheet
+ (NSDictionary *)stylesheet {
    return @{
             @"NotificationView_Container_View": @{
                     PK_VIEW_CORNER_RADIUS: @3,
                     },
             @"NotificationView_Container_Type_Success_View": @{
                     PK_VIEW_BACKGROUND_COLOR: UICOLOR_FROM_HEXA(COLOR_PRIMARY, 0.9),
                     },
             @"NotificationView_Container_Type_Error_View": @{
                     PK_VIEW_BACKGROUND_COLOR: UICOLOR_FROM_HEXA(COLOR_ALERT, 0.9),
                     },
             @"NotificationView_Container_Type_Info_View": @{
                     PK_VIEW_BACKGROUND_COLOR: UICOLOR_FROM_HEXA(COLOR_GRAY_DARKEST, 0.9),
                     },
             @"NotificationView_Image_ImageView": @{
                     PK_IMAGE_VIEW_TINT_COLOR: UICOLOR_FROM_HEX(COLOR_WHITE),
                     },
             @"NotificationView_Title_Label": @{
                     PK_LABEL_FONT: [UIFont fontWithName:FONT_NAME(FONT_FAMILY_PRIMARY, FONT_WEIGHT_REGULAR) size:FONT_SIZE_LARGE],
                     PK_LABEL_TEXT_COLOR: UICOLOR_FROM_HEX(COLOR_WHITE),
                     },
             };
}
@end
