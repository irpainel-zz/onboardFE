//
//  Constants.m
//  onboardFE
//
//  Created by Tqt iOS on 5/20/2016.
//  Copyright (c) 2016 Taqtile. All rights reserved.
//

#import "Constants.h"

#ifdef ENV_PRODUCTION
NSString * const kMyStringConstant = @"MyProductionStringConstant";
int const kMyIntConstant = 0;
BOOL const kBooleanConstant = YES;
#else
#ifdef ENV_STAGING
NSString * const kMyStringConstant = @"MyStagingStringConstant";
int const kMyIntConstant = 1;
BOOL const kBooleanConstant = YES;
#else
NSString * const kMyStringConstant = @"MyDevelopmentStringConstant";
int const kMyIntConstant = 2;
BOOL const kBooleanConstant = NO;
#endif
#endif