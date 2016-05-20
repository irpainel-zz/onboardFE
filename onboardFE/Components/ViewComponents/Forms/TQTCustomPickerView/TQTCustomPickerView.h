//
//  TQTCustomPickerView.h
//  
//
//  Created by Tqt iOS on 11/25/2015.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "TQTCustomTextFieldView.h"

/**
 * Implementation of a picker using textfield
 */
@interface TQTCustomPickerView : TQTCustomTextFieldView

@property (strong, nonatomic) UIPickerView *pickerView;

-(void)setupPickerAppearence;
-(void)setupPickerForOneItem;

// Methods to be extended on subclasses
-(void)initialSetup;

@end
