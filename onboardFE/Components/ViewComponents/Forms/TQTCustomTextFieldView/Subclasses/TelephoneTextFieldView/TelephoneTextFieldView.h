//
//  TelephoneTextFieldView.h
//  
//
//  Created by Taqtile on 8/14/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "TQTCustomTextFieldView.h"

typedef enum : NSUInteger {
    TelephoneTextFieldMaskPhone = 0,
    TelephoneTextFieldMaskMobilePhone = 1,
} TelephoneTextFieldType;

@interface TelephoneTextFieldView : TQTCustomTextFieldView

-(NSString *)getDDD;
-(NSString *)getNumber;

#if TARGET_INTERFACE_BUILDER
@property (nonatomic) IBInspectable NSUInteger type;
#else
@property (nonatomic) TelephoneTextFieldType type;
#endif

@end
