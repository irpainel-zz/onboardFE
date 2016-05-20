//
//  StatePickerView.h
//  
//
//  Created by Taqtile on 12/15/15.
//  Copyright © 2015 Taqtile. All rights reserved.
//

#import "TQTCustomPickerView.h"

@interface StatePickerView : TQTCustomPickerView<UIPickerViewDelegate, UIPickerViewDataSource>

-(NSString *)selectedValue;
-(NSString *)selectedTitle;
-(void)setPickerValue:(NSString *)initial;

@end
