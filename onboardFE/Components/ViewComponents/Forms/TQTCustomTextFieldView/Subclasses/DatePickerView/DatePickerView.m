//
//  DateTextFieldView.m
//  
//
//  Created by Taqtile on 8/14/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "DatePickerView.h"
#import "TQTStylesheets.h"
#import "NSDate+FormattedDate.h"
#import "Message.h"
#import "TQTTypographyStylesheet.h"
#import "Colors.h"

#define DATE_FORMAT @"dd/MM/yyyy"

@implementation DatePickerView{
    UIDatePicker *_pickerView;
    NSDateFormatter *_formatter;
}

-(void)setupOnInitWithFrame{
    [super setupOnInitWithFrame];
    [self initialSetup];
}

-(void)setupOnInitWithCoder{
    [super setupOnInitWithCoder];
    [self initialSetup];
}

-(NSString *)nibName{
    return [[TQTCustomTextFieldView class] description];
}

-(void)initialSetup{
    _formatter = [[NSDateFormatter alloc] init];
    [_formatter setDateFormat:DATE_FORMAT];
    [self setupPlaceholder];
    [self setupPickerView];
    [self setRequired:YES];
    [self setLabelString:[Message messageWithKey:@"textfield.label.date_of_birth"]];
}

-(void)setupPlaceholder{
    [self setPlaceholderWithString:[Message messageWithKey:@"textfield.placeholder.date_of_birth"]];
}

-(void)setDateFromString:(NSString *)dateString
{
    if (dateString) {
        [_pickerView setDate:[_formatter dateFromString:dateString] animated:YES];
        [self didSelectDate:_pickerView];
    }

}

#pragma mark - UIDatePicker

-(void)setupPickerView
{
    _pickerView = [[UIDatePicker alloc] init];
    [self setInputView:_pickerView];
    [_pickerView addTarget:self action:@selector(didSelectDate:) forControlEvents:UIControlEventValueChanged];
    [self setupPickerAppearence];
}

-(void)setupPickerAppearence {
    [self fixDatePickerMode];
    [self.textFieldButton setHidden:NO];
    [self.textFieldButton setAttributedTitle:[[NSAttributedString alloc] initWithString:@""] forState:UIControlStateNormal];
    [self.textFieldButton setTitle:@"" forState:UIControlStateNormal];
    [self.textFieldButton setImage:[[UIImage imageNamed:@"ic-textfield_calendar"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [self.textFieldContainerView setHidden:NO];
}

-(void)fixDatePickerMode {
    [_pickerView setDatePickerMode:UIDatePickerModeDateAndTime];
    [_pickerView setDatePickerMode:UIDatePickerModeDate];
}

-(void)didSelectDate:(UIDatePicker *)picker
{
    [self setText:[_formatter stringFromDate:[picker date]] silent:YES];
}

#pragma mark - Override

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    [super textFieldDidBeginEditing:textField];
    [self didSelectDate:_pickerView];
}

- (void)textFieldDidChange {
    [self setText:@"" silent:YES];
}

- (BOOL)isInputValid {
    [self isValidDate];
    return [super isInputValid] && [self isValidDate];
}

#pragma mark - Private methods

- (BOOL)isValidDate {
    return [_pickerView.date timeIntervalSinceDate:[NSDate dateWithYear:1900 month:1 day:1]] > 0 &&
    [_pickerView.date timeIntervalSinceNow] < 0;
}

#pragma mark - Override
-(void)setState:(TQTCustomTextFieldViewState)state {
    [super setState:state];
    [self setupPickerAppearence];
}
@end
