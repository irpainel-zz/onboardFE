//
//  TQTCustomTextFieldView.m
//  
//
//  Created by Tqt iOS on 11/25/2015.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "TQTCustomTextFieldView.h"
#import "TQTStylesheets.h"
#import "Components.h"
#import "TQTTypographyStylesheet.h"
#import "NSString+Clean.h"
#import "UIView+TQTAttachToSuperview.h"
#import "UIView+Constraints.h"
#import "Message.h"

@implementation TQTCustomTextFieldView
{
    __weak IBOutlet UIView *_captionContainer;
}

static float const kAnimationDuration = ANIMATION_IMAGE_FADE_IN_DURATION;

-(void)setupOnInitWithCoder {
    [self setup];
}

-(void)setupOnInitWithFrame {
    [self setup];
}

-(void)setup {
    [self setState:TQTCustomTextFieldViewStateDefault];
    [self setCaptionText:@""];
    [self setCaptionHidden:YES];

    self.textField.delegate = self;

    [self.textField addTarget:self
                  action:@selector(textFieldDidChange)
        forControlEvents:UIControlEventEditingChanged];
}

#pragma mark - public methods
-(void)setLabelString: (NSString *)string {
    const BOOL shouldInsertAsterisk = self.required && [string characterAtIndex:(string.length - 1)] != '*';
    NSString *labelText = shouldInsertAsterisk ? [NSString stringWithFormat:@"%@*", [string uppercaseString]] : [string uppercaseString];
    [self.fieldNameLabel setText:labelText];
    [self setLabelHidden:!string.length];
}

-(void)setPlaceholderWithString: (NSString *)string{
    NSDictionary * attributes = [TQTTypographyStylesheet attributedStringAttributes][@"InputPlaceholder"];
    self.textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:string attributes:attributes];
}

-(void)setText:(NSString *)text
{
    [self setText:text silent:NO];
}

-(void)setText:(NSString *)text
        silent:(BOOL)silent
{
    if (text) {
        self.textField.text = text;
    }
    if (!silent) {
        [self textFieldDidChange];
    }
}

-(void)setCaptionText: (NSString *) string {
    self.captionLabel.text = string;
}

-(void)setKeyboardType:(UIKeyboardType)type andSecureTextEntry:(BOOL)isSecure {
    [self.textField setKeyboardType:type];
    [self.textField setSecureTextEntry:isSecure];
}

-(void)setInputView:(UIView *)view {
    self.textField.inputView = view;
}

-(void)setReturnKeyType:(UIReturnKeyType)returnKeyType {
    self.textField.returnKeyType = returnKeyType;
}

-(void)setPlaceholderInfoIfRequired {
    NSString *placeholder = self.textField.attributedPlaceholder.string;
    if (placeholder && _required) {
        [self setPlaceholderWithString:[placeholder stringByAppendingString:@"*"]];
    }
}

-(void)setAutocapitalizationType:(UITextAutocapitalizationType)autocapitalizationType {
    self.textField.autocapitalizationType = autocapitalizationType;
}

-(BOOL)isInputValid {
    if (_required && [[self getText] length] == 0) {
        return NO;
    }
    else {
        return YES;
    }
}

-(void)setRequired:(BOOL)required {
    _required = required;
    if (required && !_captionLabel.text.length) {
        [self setCaptionText:[Message messageWithKey:@"textfield.caption.required_field"]];
    }
    if (required && _fieldNameLabel.text.length) {
        [self setLabelString:_fieldNameLabel.text];
    }
}

-(NSString*)getText {
    return self.textField.text;
}

-(void)clearTextfield {
    self.textField.text = @"";
    [self textFieldDidChange];
}

-(void)validate {
    if (!self.required && (self.textField.text.length == 0)) {
        [self setState:TQTCustomTextFieldViewStateDefault];
    }
    else if ([self isInputValid]){
        [self setState:TQTCustomTextFieldViewStateHighlight];
    } else {
        [self setState:TQTCustomTextFieldViewStateError];
    }
}

#pragma mark - state setup methods
-(void)setState:(TQTCustomTextFieldViewState)state {
    if (_state == state) {
        return;
    }

    _state = state;

    [self.textFieldButton setUserInteractionEnabled:YES];
    [self setUserInteractionEnabled:YES];
    [self.textField setEnabled:YES];
    [self setCaptionHidden:YES];

    switch (state) {
        case TQTCustomTextFieldViewStateError:
            [self errorStateSetup];
             break;
        case TQTCustomTextFieldViewStateActive:
            [self activeStateSetup];
            break;
        case TQTCustomTextFieldViewStateDefault:
            [self defaultSetup];
            break;
        case TQTCustomTextFieldViewStateInactive:
            [self inactiveStateSetup];
             break;
            break;
        case TQTCustomTextFieldViewStateHighlight:
            [self highlightStateSetup];
            break;
        default:
            break;
    }
}

- (void)defaultSetup {
    TQTStylesheets *shared = [TQTStylesheets sharedInstance];
    [shared setStyle:@"CustomTextFieldView_TextField_View" forView:self.textFieldContainerView];
    [shared setStyle:@"CustomTextFieldView_TextField" forView:self.textField];
}

- (void)errorStateSetup {
    TQTStylesheets *shared = [TQTStylesheets sharedInstance];
    [shared setStyle:@"CustomTextFieldView_TextField_View" forView:self.textFieldContainerView];
    [shared setStyle:@"CustomTextFieldView_TextField" forView:self.textField];
    [shared setStyle:@"CustomTextFieldView_TextField_IsError_View" forView:self.textFieldContainerView];
    [shared setStyle:@"CustomTextFieldView_IsError_Button" forView:self.textFieldButton];

    [self.textFieldButton setImage:[[UIImage imageNamed:@"ic-error"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [self.textFieldButton setUserInteractionEnabled:NO];
    [self setButtonHiddenAnimated:NO];

    [self setCaptionHidden:NO];
}

- (void)activeStateSetup {
    TQTStylesheets *shared = [TQTStylesheets sharedInstance];
    [shared setStyle:@"CustomTextFieldView_TextField" forView:self.textField];
    [shared setStyle:@"CustomTextFieldView_TextField_IsActive_View" forView:self.textFieldContainerView];

    [self textFieldDidChange];
}

- (void)inactiveStateSetup {
    TQTStylesheets *shared = [TQTStylesheets sharedInstance];
    [shared setStyle:@"CustomTextFieldView_TextField_IsInactive_View" forView:self.textFieldContainerView];
    [shared setStyle:@"CustomTextFieldView_TextField_IsInactive" forView:self.textField];
    [shared setStyle:@"CustomTextFieldView_IsInactive_Button" forView:self.textFieldButton];

    [self setButtonHiddenAnimated:YES];
    [self setUserInteractionEnabled:NO];

    [self.textField setEnabled:NO];
}

- (void)highlightStateSetup {
    TQTStylesheets *shared = [TQTStylesheets sharedInstance];
    [shared setStyle:@"CustomTextFieldView_TextField_View" forView:self.textFieldContainerView];
    [shared setStyle:@"CustomTextFieldView_TextField" forView:self.textField];
    [shared setStyle:@"CustomTextFieldView_IsHighlight_Button" forView:self.textFieldButton];

    [self.textFieldButton setImage:[[UIImage imageNamed:@"ic-check"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [self.textFieldButton setUserInteractionEnabled:NO];
    [self setButtonHiddenAnimated:NO];
}

#pragma mark - Action
- (IBAction)buttonClick:(id)sender {
    if(self.state == TQTCustomTextFieldViewStateActive){
        [self clearTextfield];
    }
}

#pragma mark - show/hide methods
-(void)setLabelHidden:(BOOL)hidden {
    static CGFloat topContainerConstraint;
    if (!topContainerConstraint) {
        topContainerConstraint = self.textFieldContainerView.topConstraint.constant;
    }
    self.textFieldContainerView.topConstraint.constant = hidden ? 0 : topContainerConstraint;
}

- (void)setButtonHiddenAnimated:(BOOL)hidden{
    if (hidden && self.textFieldButton.hidden == NO){
        // hide
        [self.textFieldButton setHidden:NO];
        [self.textFieldButton setAlpha:1];

        [UIView animateWithDuration:ANIMATION_IMAGE_FADE_IN_DURATION
                         animations:^{
                             [self.textFieldButton setAlpha:0];
                         } completion:^(BOOL finished) {
                              [self.textFieldButton setHidden:YES];
                         }];
    }
    else if (!hidden && self.textFieldButton.hidden == YES){
        [self.textFieldButton setHidden:NO];
        [self.textFieldButton setAlpha:0];

        [UIView animateWithDuration:ANIMATION_IMAGE_FADE_IN_DURATION
                         animations:^{
                             [self.textFieldButton setAlpha:1];
                         } completion:^(BOOL finished) {
                             [self.textFieldButton setHidden:NO];
                         }];
    }
}

-(void)setCaptionHidden:(BOOL)hidden{
    if(!hidden && self.captionLabel.hidden && self.captionLabel.text.length != 0 ){
        // show
        [self.superview layoutIfNeeded];
        [_captionContainer removeConstraint:_captionContainer.heightConstraint];
        self.captionLabel.hidden = NO;
        [UIView animateWithDuration:kAnimationDuration
                         animations:^{
                             self.captionLabel.alpha = 1;
                             [self.superview layoutIfNeeded];
                         }];
    } else if (hidden && !self.captionLabel.hidden){
        // hide
        [self.superview layoutIfNeeded];
        [_captionContainer setHeightConstraintConstant:0];
        [UIView animateWithDuration:kAnimationDuration
                         animations:^{
                             self.captionLabel.alpha = 0;
                             [self.superview layoutIfNeeded];
                         } completion:^(BOOL finished) {
                             self.captionLabel.hidden = YES;
                         }];
    }
}

#pragma mark - UITextField delegate
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    [self setState:TQTCustomTextFieldViewStateActive];

    if (_delegate && [_delegate respondsToSelector:@selector(customTextFieldViewDidBeginEditing:)]) {
        [_delegate customTextFieldViewDidBeginEditing:self];
    }
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    [self validate];
    if (_delegate && [_delegate respondsToSelector:@selector(customTextFieldViewDidEndEditing:)]) {
        [_delegate customTextFieldViewDidEndEditing:self];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];

    if (_delegate && [_delegate respondsToSelector:@selector(customTextFieldViewShouldReturn:)]){
        return [_delegate customTextFieldViewShouldReturn:self];
    }

    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if([string isEqualToString:@""] || !self.mask || [self.mask isEqualToString:@""]){
        return YES;
    }

    UITextPosition* beginning = textField.beginningOfDocument;
    UITextPosition* cursorLocation = [textField positionFromPosition:beginning offset:range.location + string.length];

    NSString* normalText = textField.text;
    NSString* newString = [normalText appendString:string atIndex:range];
    NSString* newStringClean = [[newString stringWithOnlyNumbers] withMask:self.mask];


    if([newString isEqualToString:newStringClean]) return YES;

    textField.text = newStringClean;
    UITextRange* textRange = [textField textRangeFromPosition:cursorLocation toPosition:cursorLocation];
    if(cursorLocation) {
        textField.selectedTextRange = textRange;
    }
    return NO;
}

- (void)textFieldDidChange{
    if (self.textField.text.length > 0){
        [self.textFieldButton setImage:[UIImage imageNamed:@"ic-clear"] forState:UIControlStateNormal];
        [[TQTStylesheets sharedInstance] setStyle:@"CustomTextFieldView_Button" forView:self.textFieldButton];
        [self setButtonHiddenAnimated:NO];
    }
    else{
        [self setButtonHiddenAnimated:YES];
    }

    if (_delegate && [_delegate respondsToSelector:@selector(customTextFieldViewDidChange:)]) {
        [_delegate customTextFieldViewDidChange:self];
    }
}

#pragma mark - hide labels
-(void)hideCaptionLabel {
    [self.fieldNameLabel setHidden:YES];
    [self.fieldNameLabel setHeightConstraintConstant:0];
}

@end
