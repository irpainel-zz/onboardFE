//
//  TQTCustomPickerView.m
//  
//
//  Created by Tqt iOS on 11/25/2015.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "TQTCustomPickerView.h"
#import "TQTTypographyStylesheet.h"
#import "TQTStylesheets.h"
#import "NSString+Validations.h"

@implementation TQTCustomPickerView
{
}

#pragma mark - View lifecycle
-(void)setupOnInitWithCoder {
    [super setupOnInitWithCoder];
    [self initialSetup];
}

-(void)setupOnInitWithFrame {
    [super setupOnInitWithFrame];
    [self initialSetup];
}

-(void)dealloc {
    [_pickerView removeFromSuperview];
    _pickerView = nil;
}

-(void)initialSetup {
    [self.textFieldButton addTarget:self action:@selector(didTouchPickerButton) forControlEvents:UIControlEventTouchUpInside];
    _pickerView = [[UIPickerView alloc] init];
    [self.window addSubview:_pickerView];
    self.textField.inputView = _pickerView;

    [self setLabelString:@""];
    self.captionLabel.text = @"";
    
    [self setupPickerAppearence];
}

-(void)setupPickerAppearence {
    [self.textFieldButton setHidden:NO];
    [self.textFieldButton setAttributedTitle:[[NSAttributedString alloc] initWithString:@""] forState:UIControlStateNormal];
    [self.textFieldButton setTitle:@"" forState:UIControlStateNormal];
    [self.textFieldButton setImage:[[UIImage imageNamed:@"ic-textfield_picker"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [self.textFieldContainerView setHidden:NO];
}

-(void)setupPickerForOneItem {
    [self setState:TQTCustomTextFieldViewStateInactive];
    [self.textFieldButton setHidden:YES];
}

-(void)setText:(NSString *)text {
    [super setText:text];
    if ([text isOnlyNumber]) {
        self.textField.textAlignment = NSTextAlignmentCenter;
    }
}

#pragma mark - Action
-(void)didTouchPickerButton {
    [self.textField becomeFirstResponder];
}

#pragma mark - Override
- (void)textFieldDidChange{
}

-(NSString *)nibName {
    return [[TQTCustomTextFieldView class] description];
}

-(void)setState:(TQTCustomTextFieldViewState)state {
    [super setState:state];
    [self setupPickerAppearence];
    switch (state) {
        case TQTCustomTextFieldViewStateError:
            break;
        case TQTCustomTextFieldViewStateActive:
            break;
        case TQTCustomTextFieldViewStateDefault:
            break;
        case TQTCustomTextFieldViewStateInactive:
            break;
        case TQTCustomTextFieldViewStateHighlight:
            break;
        default:
            break;
    }
}
@end
