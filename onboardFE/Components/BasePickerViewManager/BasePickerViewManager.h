//
//  BasePickerViewManager.h
//  ClienteMais
//
//  Created by Taqtile on 8/21/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Message.h"
#import "TQTCustomTextFieldView.h"
#import "TQTCustomPickerView.h"

@protocol BasePickerViewManagerDelegate

-(void)didSelectRow:(NSInteger)row;

@end


@interface BasePickerViewManager : NSObject <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic) TQTCustomPickerView* field;
@property (nonatomic) NSArray* data;
@property (nonatomic, weak) id<BasePickerViewManagerDelegate> delegate;

-(instancetype)initWithPickerView:(TQTCustomPickerView *)field;
-(NSString*) titleForItemAtRow:(NSInteger) row;
-(NSString*) valueForItemAtRow:(NSInteger) row;

-(void)setPickerValue:(NSString *)string;
-(void)setPickerIndex:(NSInteger)index;

@end
