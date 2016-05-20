//
//  CepTextFieldView.h
//  
//
//  Created by Taqtile on 8/14/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "TQTCustomTextFieldView.h"

@class CepTextFieldView;

@protocol CepTextFieldViewDelegate <NSObject>

- (void)cepTextFieldDidEndEditing:(CepTextFieldView *)cepTextField;

@end

@interface CepTextFieldView : TQTCustomTextFieldView

@property (weak, nonatomic) id <CepTextFieldViewDelegate> cepDelegate;

- (NSString*)getFormattedCep;

@end
