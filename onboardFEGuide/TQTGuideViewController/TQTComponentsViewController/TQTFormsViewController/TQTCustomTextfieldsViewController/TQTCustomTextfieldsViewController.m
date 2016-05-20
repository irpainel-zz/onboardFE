//
//  TQTCustomTextfieldsViewController.m
//  
//
//  Created by Taqtile on 11/30/15.
//  Copyright © 2015 Taqtile. All rights reserved.
//

#import "AddressNumberTextFieldView.h"
#import "CepTextFieldView.h"
#import "CityTextFieldView.h"
#import "ComplementTextFieldView.h"
#import "CPFTextFieldView.h"
#import "DistrictTextFieldView.h"
#import "EmailTextFieldView.h"
#import "NameTextFieldView.h"
#import "PasswordTextFieldView.h"
#import "RGTextFieldView.h"
#import "StreetTextFieldView.h"
#import "TelephoneTextFieldView.h"
#import "TQTCustomTextfieldsViewController.h"


@implementation TQTCustomTextfieldsViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Custom textfields"];
}

#pragma mark - overriden method

- (void)addComponents {
    for (Class class in [self textFieldClasses]) {
        [self addViewWithDefaultMarginsAndClass:class height:0];
    }
}

- (const NSArray *)textFieldClasses {
    const NSArray *textfieldsClasses = @[
                                         [EmailTextFieldView class],
                                         [PasswordTextFieldView class],
                                         [NameTextFieldView class],
                                         [RGTextFieldView class],
                                         [CPFTextFieldView class],
                                         [TelephoneTextFieldView class],
                                         [StreetTextFieldView class],
                                         [AddressNumberTextFieldView class],
                                         [ComplementTextFieldView class],
                                         [DistrictTextFieldView class],
                                         [CityTextFieldView class],
                                         [CepTextFieldView class],
                                         ];
    return textfieldsClasses;
}
@end