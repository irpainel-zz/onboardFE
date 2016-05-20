//
//  TelephoneTextFieldView.m
//  
//
//  Created by Taqtile on 8/14/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "TelephoneTextFieldView.h"
#import "NSString+Validations.h"
#include "NSString+Clean.h"
#import "Message.h"

@interface TelephoneTextFieldView ()

@end

@implementation TelephoneTextFieldView

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
    [self setKeyboardType:UIKeyboardTypePhonePad andSecureTextEntry:NO];
    [self setupMask];
}

-(void)setupLabel{
    switch (self.type) {
        case TelephoneTextFieldMaskPhone:
            [self setLabelString:[Message messageWithKey:@"textfield.label.phone_number"]];
            break;
        case TelephoneTextFieldMaskMobilePhone:
            [self setLabelString:[Message messageWithKey:@"textfield.label.telephone_mobile"]];
            break;
        default:
            [self setLabelString:[Message messageWithKey:@"textfield.label.telephone"]];
            break;
    }
}

-(void)setupPlaceholder{
    switch (self.type) {
        case TelephoneTextFieldMaskPhone:
            [self setPlaceholderWithString:[Message messageWithKey:@"textfield.placeholder.phone_number"]];
            break;
        case TelephoneTextFieldMaskMobilePhone:
            [self setPlaceholderWithString:[Message messageWithKey:@"textfield.placeholder.telephone_mobile"]];
            break;
        default:
            [self setPlaceholderWithString:[Message messageWithKey:@"textfield.placeholder.telephone"]];
            break;
    }
}

- (void)setText:(NSString *)text silent:(BOOL)silent {
    [super setText:[[text stringWithOnlyNumbers] withMask:self.mask] silent:silent];
}

- (void)setupMask {
    switch (self.type) {
        case TelephoneTextFieldMaskPhone:
            self.mask = @"(##) ####-####";
            break;
        case TelephoneTextFieldMaskMobilePhone:
            self.mask = @"(##) #####-####";
            break;
        default:
            self.mask = @"(##) #####-####";
            break;
    }
}

-(NSString *)getDDD
{
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\((\\d{2})\\) (\\d{4,5})-(\\d{0,4})"
                                                                           options:0
                                                                             error:nil];
    return [regex stringByReplacingMatchesInString:[self getText]
                                    options:0
                                      range:NSMakeRange(0, [[self getText] length])
                               withTemplate:@"$1"];
}
-(NSString *)getNumber
{
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\((\\d{2})\\) (\\d{4,5})-(\\d{0,4})"
                                                                           options:0
                                                                             error:nil];
    return [regex stringByReplacingMatchesInString:[self getText]
                                           options:0
                                             range:NSMakeRange(0, [[self getText] length])
                                      withTemplate:@"$2$3"];
}

- (BOOL)isInputValid{
    NSString *number = [self getNumber];
    if ([super isInputValid] && number.length == 0) {
        return YES;
    }
    else {
        return [number isValidPhoneNumber];
    }
}

#pragma mark - setter
-(void)setType:(TelephoneTextFieldType)type {
    _type = type;
    [self setupMask];
    [self setupLabel];
    [self setupPlaceholder];
}

@end
