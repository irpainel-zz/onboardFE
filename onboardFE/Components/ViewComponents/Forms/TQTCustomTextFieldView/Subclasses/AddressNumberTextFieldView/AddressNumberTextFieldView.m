//
//  AdressNumberTextFieldView.m
//  
//
//  Created by Taqtile on 8/14/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "AddressNumberTextFieldView.h"
#import "NSString+Validations.h"
#import "Message.h"

@implementation AddressNumberTextFieldView

-(void)setupOnInitWithFrame{
    [super setupOnInitWithFrame];
    [self initialSetup];
}

-(void)setupOnInitWithCoder{
    [super setupOnInitWithCoder];
    [self initialSetup];
}

-(void)initialSetup{
    [self setupPlaceholder];
    [self setupLabel];
    [self setKeyboardType:UIKeyboardTypeNumberPad andSecureTextEntry:NO];
    [self setRequired:YES];
}

-(void)setupPlaceholder{
    [self setPlaceholderWithString:[Message messageWithKey:@"textfield.placeholder.address_number"]];
}

-(void)setupLabel{
    [self setLabelString:[Message messageWithKey:@"textfield.label.address_number"]];
}


-(NSString *)nibName{
    return [[TQTCustomTextFieldView class] description];
}

-(BOOL)isInputValid
{
    return  [super isInputValid] && [[self getText] isOnlyNumber];
}

@end
