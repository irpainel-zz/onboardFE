//
//  TQTStylesheetImporter.m
//  onboardFE
//
//  Created by Tqt iOS on 5/20/2016.
//  Copyright (c) 2016 Taqtile. All rights reserved.
//

#import "LoadingViewStylesheet.h"
#import "NotificationViewStylesheet.h"
#import "PlaceholderStylesheet.h"
#import "TQTBaseStylesheet.h"
#import "TQTButtonStylesheet.h"
#import "TQTCustomCheckboxButtonViewStylesheet.h"
#import "TQTCustomRadioButtonViewStylesheet.h"
#import "TQTCustomTextFieldViewStylesheet.h"
#import "TQTStylesheetImporter.h"
#import "TQTStylesheets.h"
#import "TQTViewStylesheet.h"
#import "TQTTypographyStylesheet.h"


@implementation TQTStylesheetImporter
+ (void)setupTQTStylesheet {
    TQTStylesheets *sharedInstance = [TQTStylesheets sharedInstance];
    [sharedInstance import:[TQTBaseStylesheet stylesheet]];
    [sharedInstance import:[TQTTypographyStylesheet stylesheet]];
    [sharedInstance import:[TQTButtonStylesheet stylesheet]];
    [sharedInstance import:[TQTCustomTextFieldViewStylesheet stylesheet]];
    [sharedInstance import:[TQTCustomRadioButtonViewStylesheet stylesheet]];
    [sharedInstance import:[TQTCustomCheckboxButtonViewStylesheet stylesheet]];
    [sharedInstance import:[TQTViewStylesheet stylesheet]];
    [sharedInstance import:[LoadingViewStylesheet stylesheet]];
    [sharedInstance import:[NotificationViewStylesheet stylesheet]];
    [sharedInstance import:[PlaceholderStylesheet stylesheet]];

}
@end
