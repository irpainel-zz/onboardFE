//
//  CPFTextFieldView.m
//  
//
//  Created by Taqtile on 8/14/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "CPFTextFieldView.h"
#import "Message.h"
#import "NSString+Clean.h"
#import "NSString+Validations.h"


@interface CPFTextFieldView ()

@end

@implementation CPFTextFieldView

@synthesize cpfLength = _cpfLength;

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
    [self setupPlaceholder];
    [self setRequired:YES];
    [self setKeyboardType:UIKeyboardTypeNumberPad andSecureTextEntry:NO];
    [self setupMask];
    [self setupLength];
}

-(void)setupLabel{
    [self setLabelString:[Message messageWithKey:@"textfield.label.cpf"]];
}

-(void)setupPlaceholder{
    [self setPlaceholderWithString:[Message messageWithKey:@"textfield.placeholder.cpf"]];
}

-(NSString *)nibName{
    return [[TQTCustomTextFieldView class] description];
}

- (void)setText:(NSString *)text silent:(BOOL)silent {
    [super setText:[[text stringWithOnlyNumbers] withMask:self.mask] silent:silent];
}

- (void)setupMask {
    self.mask = @"###.###.###-##";
}

- (void)setupLength {
    _cpfLength = 11;
}

#pragma mark - Public methods
- (NSString*)getFormattedCpf{
    return [[self getText] stringWithOnlyNumbers];
}

- (BOOL)isInputValid{
    return [super isInputValid] && [[self getFormattedCpf] isValidCpf];
}



@end
