//
//  NSString+Validations.h
//  
//
//  Created by Indigo on 8/20/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Validations)

-(BOOL)isValidName;
-(BOOL)isValidEmail;
-(BOOL)isValidPassword;
-(BOOL)isOnlyNumber;
-(BOOL)isValidRG;
-(BOOL)isValidPhoneNumber;
-(BOOL)isValidState;
-(BOOL)isValidCep;
-(BOOL)isValidCpf;

@end
