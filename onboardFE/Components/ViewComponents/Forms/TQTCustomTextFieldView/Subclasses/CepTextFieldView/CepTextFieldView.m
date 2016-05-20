//
//  CepTextFieldView.m
//  
//
//  Created by Taqtile on 8/14/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "CepTextFieldView.h"
#import "Message.h"
#import "NSString+Clean.h"
#import "NSString+Validations.h"
#import "TQTStylesheets.h"


@interface CepTextFieldView ()

@end

@implementation CepTextFieldView

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
    [self setKeyboardType:UIKeyboardTypeNumberPad andSecureTextEntry:NO];
    [self setRequired:YES];
    [self setupMask];
}

-(void)setupPlaceholder{
    [self setPlaceholderWithString:[Message messageWithKey:@"textfield.placeholder.cep"]];
}

-(void)setupLabel{
    [self setLabelString:[Message messageWithKey:@"textfield.placeholder.cep"]];
}


- (void)setText:(NSString *)text silent:(BOOL)silent {
    [super setText:[[text stringWithOnlyNumbers] withMask:self.mask] silent:silent];
}

- (void)setupMask {
    self.mask = @"#####-###";
}

-(BOOL)isInputValid {
    return [super isInputValid] && [[self getFormattedCep] isValidCep];
}

#pragma mark - Public methods
- (NSString*)getFormattedCep{
    return [[self getText] stringWithOnlyNumbers];
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidEndEditing:(UITextField *)textField {
    [[TQTStylesheets sharedInstance]setStyle:@"FloatLabeledTextField_IsHighlight_FloatLabeledTextField" forView:self];
    
    [self validate];

    if (self.delegate && [self.delegate respondsToSelector:@selector(customTextFieldViewDidEndEditing:)]) {
        [self.delegate customTextFieldViewDidEndEditing:self];
    }

    if (_cepDelegate && [_cepDelegate respondsToSelector:@selector(cepTextFieldDidEndEditing:)] && [self isInputValid]) {
        [_cepDelegate cepTextFieldDidEndEditing:self];
    }
}

@end
