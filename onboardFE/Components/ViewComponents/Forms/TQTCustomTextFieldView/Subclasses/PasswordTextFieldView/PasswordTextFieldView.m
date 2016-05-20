//
//  PasswordTextFieldView.m
//  
//
//  Created by Taqtile on 8/18/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "PasswordTextFieldView.h"
#import "NSString+Validations.h"
#import "Message.h"

@implementation PasswordTextFieldView

-(void)setupOnInitWithFrame{
    [super setupOnInitWithFrame];
    [self initialSetup];
}

-(void)setupOnInitWithCoder{
    [super setupOnInitWithCoder];
    [self initialSetup];
}

-(void)initialSetup{
    [self setupLabel];
    [self setCaptionText:[Message messageWithKey:@"textfield.caption.invalid_password"]];
    [self setPlaceholderWithString:[Message messageWithKey:@"textfield.placeholder.password"]];
    [self setRequired:YES];
    [self setKeyboardType:UIKeyboardTypeDefault andSecureTextEntry:YES];
}

-(void)setupLabel{
    [self setLabelString:[Message messageWithKey:@"textfield.label.password"]];
}

-(BOOL)isInputValid
{
    return [[self getText] isValidPassword];
}

-(bool)isEqualTo:(PasswordTextFieldView *)compare
{
    NSString *password = [self getText];
    NSString *confirm  = [compare getText];
    
    return [confirm length] == 0 || [password length] == 0 || [password isEqualToString:confirm];
}

-(void)validateIfEqualTo:(PasswordTextFieldView *)compare
{
    [self validateIfEqualTo:compare withForcedSelfValidation:NO];
}

-(void)validateIfEqualTo:(PasswordTextFieldView *)compare
withForcedSelfValidation:(BOOL)selfValidation
{
    if ([self isEqualTo:compare]) {
        [self setCaptionText:[Message messageWithKey:@"textfield.caption.invalid_password"]];
        if (selfValidation || [[self getText] length] > 0) {
            [self validate];
        }
    }
    else {
        [self setCaptionText:[Message messageWithKey:@"textfield.caption.passwords_not_equal"]];
        [self setState:TQTCustomTextFieldViewStateError];
    }
}

-(NSString *)nibName{
    return [[TQTCustomTextFieldView class] description];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if ((range.location >= 10 && ![string isEqualToString:@""]) || string.length > 1) {
        return NO;
    }
    return [super textField:textField shouldChangeCharactersInRange:range replacementString:string];
}

@end
