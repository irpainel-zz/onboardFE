//
//  CityTextFieldView.m
//  
//
//  Created by Taqtile on 8/14/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "CityTextFieldView.h"
#import "Message.h"

@implementation CityTextFieldView

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
}

-(void)setupLabel{
    [self setLabelString:[Message messageWithKey:@"textfield.label.city"]];
}

-(void)setupPlaceholder{
    [self setPlaceholderWithString:[Message messageWithKey:@"textfield.placeholder.city"]];
}

-(void)setupKeyboardConfiguration {
    [self setKeyboardType:UIKeyboardTypeDefault andSecureTextEntry:NO];
    [self setAutocapitalizationType:UITextAutocapitalizationTypeWords];
}

-(NSString *)nibName{
    return [[TQTCustomTextFieldView class] description];
}

@end
