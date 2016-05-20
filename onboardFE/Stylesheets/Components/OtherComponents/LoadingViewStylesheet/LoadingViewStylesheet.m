//
//  LoadingViewsStylesheet.m
//  
//
//  Created by Taqtile on 8/7/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "LoadingViewStylesheet.h"
#import <UIKit/UIKit.h>
#import "TQTStylesheetsProperties.h"
#import "Fonts.h"
#import "Colors.h"

@implementation LoadingViewStylesheet
+ (NSDictionary *)stylesheet {
    return @{
             @"LoadingView_View": @{
                     PK_VIEW_BACKGROUND_COLOR: UICOLOR_FROM_HEX(COLOR_GRAY_LIGHTEST),
                     PK_VIEW_CORNER_RADIUS: @6,
                     },
             @"LoadingView_Is_OverView_View": @{
                     PK_VIEW_BACKGROUND_COLOR: UICOLOR_FROM_HEX(COLOR_WHITE),
                     },
             @"LoadingView_Overlay_View": @{
                     PK_VIEW_BACKGROUND_COLOR: UICOLOR_FROM_HEX(COLOR_WHITE),
                     },
             };
}

@end
