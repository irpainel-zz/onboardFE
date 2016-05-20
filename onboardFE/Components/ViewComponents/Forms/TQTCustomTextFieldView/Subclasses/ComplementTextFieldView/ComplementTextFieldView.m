//
//  ComplementTextFieldView.m
//  
//
//  Created by Taqtile on 8/14/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "ComplementTextFieldView.h"
#import "Message.h"

@implementation ComplementTextFieldView

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
    [self setKeyboardType:UIKeyboardTypeNamePhonePad andSecureTextEntry:NO];
    [self setRequired:NO];
}

-(void)setupLabel{
    [self setLabelString:[Message messageWithKey:@"textfield.label.complement"]];
}

-(void)setupPlaceholder{
    [self setPlaceholderWithString:[Message messageWithKey:@"textfield.placeholder.complement"]];
}

-(NSString *)nibName{
    return [[TQTCustomTextFieldView class] description];
}

@end
