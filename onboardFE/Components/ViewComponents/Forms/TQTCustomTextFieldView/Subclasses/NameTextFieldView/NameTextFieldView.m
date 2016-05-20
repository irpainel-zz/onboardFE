//
//  NameTextFieldView.m
//  
//
//  Created by Taqtile on 8/14/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "Message.h"
#import "NameTextFieldView.h"
#import "NSString+Validations.h"


@implementation NameTextFieldView

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
    [self setupKeyboardConfiguration];
    [self setCaptionText:[Message messageWithKey:@"textfield.caption.name_validation"]];
}

-(void)setupLabel{
    [self setLabelString:[Message messageWithKey:@"textfield.label.name"]];
}

-(void)setupPlaceholder{
    [self setPlaceholderWithString:[Message messageWithKey:@"textfield.placeholder.name"]];
}

-(void)setupKeyboardConfiguration {
    [self setKeyboardType:UIKeyboardTypeDefault andSecureTextEntry:NO];
    [self setAutocapitalizationType:UITextAutocapitalizationTypeWords];
}

-(NSString *)nibName{
    return [[TQTCustomTextFieldView class] description];
}

-(BOOL)isInputValid {
    return [[self getText] isValidName];
}

@end
