//
//  TQTViewStylesheet.m
//  onboardFE
//
//  Created by Tqt iOS on 5/20/2016.
//  Copyright (c) 2016 Taqtile. All rights reserved.
//

#import "TQTViewStylesheet.h"
#import <UIKit/UIKit.h>
#import "TQTStylesheetsProperties.h"
#import "Fonts.h"
#import "Colors.h"

@implementation TQTViewStylesheet
+ (NSDictionary *)stylesheet {
    return @{
             @"Default_View": @{
                     PK_VIEW_BACKGROUND_COLOR: UICOLOR_FROM_HEX(COLOR_WHITE),
                     },
             @"Separator_TypeDarker_View": @{
                     PK_VIEW_BACKGROUND_COLOR: UICOLOR_FROM_HEX(COLOR_GRAY)
                    },
             @"Separator_View": @{
                     PK_VIEW_BACKGROUND_COLOR: UICOLOR_FROM_HEX(COLOR_GRAY_LIGHTEST)
                    },
             };
}
@end
