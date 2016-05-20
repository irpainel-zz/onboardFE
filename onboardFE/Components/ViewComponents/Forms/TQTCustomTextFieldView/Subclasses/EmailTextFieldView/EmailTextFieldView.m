//
//  EmailTextFieldView.m
//  
//
//  Created by Taqtile on 8/14/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "EmailTextFieldView.h"
#import "NSString+Validations.h"
#import "Message.h"

@interface EmailTextFieldView ()


@end

@implementation EmailTextFieldView
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
    [self setupLabel];
    [self setupPlaceholder];
    [self setKeyboardType:UIKeyboardTypeEmailAddress andSecureTextEntry:NO];
    [self setCaptionText:[Message messageWithKey:@"textfield.caption.email_validation"]];
    [self setRequired:YES];
}

-(void)setupLabel{
    [self setLabelString:[Message messageWithKey:@"textfield.label.email"]];
}

-(void)setupPlaceholder{
    [self setPlaceholderWithString:[Message messageWithKey:@"textfield.placeholder.email"]];
}

- (BOOL)isInputValid{
    return [super isInputValid] && [[self getText] isValidEmail];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (range.location >= 100 && ![string isEqualToString:@""]) {
        return NO;
    }
    return [super textField:textField shouldChangeCharactersInRange:range replacementString:string];
}

@end
