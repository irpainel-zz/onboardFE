//
//  DateTextFieldView.h
//  
//
//  Created by Taqtile on 8/14/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "TQTCustomTextFieldView.h"

@interface DatePickerView : TQTCustomTextFieldView

-(void)setDateFromString:(NSString *)dateString;
-(void)fixDatePickerMode;

@end
