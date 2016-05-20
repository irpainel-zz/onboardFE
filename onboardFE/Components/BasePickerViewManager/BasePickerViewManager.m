//
//  BasePickerViewManager.m
//  ClienteMais
//
//  Created by Taqtile on 8/21/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "BasePickerViewManager.h"

@implementation BasePickerViewManager

-(instancetype)initWithPickerView:(TQTCustomPickerView *)field
{
    self = [super init];
    if (self) {
        self.data = @[];
        self.field = field;
        field.pickerView.delegate = self;
        field.pickerView.dataSource = self;
    }
    return self;
}

-(NSString*) titleForItemAtRow:(NSInteger) row
{
    return self.data[row];
}

-(NSString*) valueForItemAtRow:(NSInteger) row
{
    return [self titleForItemAtRow:row];
}

#pragma mark - UIPickerViewDataSource
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.data.count;
}

#pragma mark - UIPickerViewDelegate
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self titleForItemAtRow:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.field.text = self.data[row];
    [self.field resignFirstResponder];
    [self.delegate didSelectRow:row];
}

#pragma mark - setter
-(void)setData:(NSArray *)data {
    _data = data;
    if (data.count) {
        [self setPickerIndex:0];
        [self.field.pickerView reloadAllComponents];
    }
    if (data.count == 1) {
        [self.field setupPickerForOneItem];
    }
}

-(void)setPickerValue:(NSString *)string {
    [self.field.textField setText:string];
    NSInteger index = [self.data indexOfObject:string];
    [self.field.pickerView selectRow:index inComponent:0 animated:NO];
}

-(void)setPickerIndex:(NSInteger)index {
    [self.field.textField setText:[self titleForItemAtRow:index]];
    [self.field.pickerView selectRow:index inComponent:0 animated:NO];
}

@end
