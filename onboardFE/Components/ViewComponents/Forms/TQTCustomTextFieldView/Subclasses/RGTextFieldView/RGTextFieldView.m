//
//  RGTextFieldView.m
//  
//
//  Created by Taqtile on 8/14/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "Message.h"
#import "NSString+Clean.h"
#import "NSString+Validations.h"
#import "RGTextFieldView.h"


@interface RGTextFieldView ()

@end

@implementation RGTextFieldView

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
    [self setRequired:YES];
    [self setKeyboardType:UIKeyboardTypeNumbersAndPunctuation andSecureTextEntry:NO];
    [self setupMask];
}

-(void)setupLabel{
    [self setLabelString:[Message messageWithKey:@"textfield.label.rg"]];
}

-(void)setupPlaceholder{
    [self setPlaceholderWithString:[Message messageWithKey:@"textfield.placeholder.rg"]];
}

- (void)setText:(NSString *)text silent:(BOOL)silent {
    [super setText:[[text stringWithOnlyNumbers] withMask:self.mask] silent:silent];
}

- (void)setupMask {
    self.mask = @"##.###.###-#";
}

- (BOOL)isInputValid {
    return [super isInputValid] && [[self getFormattedRg] isValidRG];
}

#pragma mark - Public methods
- (NSString*)getFormattedRg{
    return [[self getText] stringWithOnlyNumbers];
}

@end
