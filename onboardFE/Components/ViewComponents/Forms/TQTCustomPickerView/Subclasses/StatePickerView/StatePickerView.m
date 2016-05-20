//
//  StatePickerView.m
//  
//
//  Created by Taqtile on 12/15/15.
//  Copyright © 2015 Taqtile. All rights reserved.
//

#import "StatePickerView.h"
#import "Message.h"
#import "StateProvider.h"

@interface StatePickerView()

@property (strong, nonatomic) StateProvider *provider;

@end

@implementation StatePickerView

-(void)initialSetup {
    [super initialSetup];

    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    [self setRequired:YES];
    [self setLabelString:[Message messageWithKey:@"textfield.label.state"]];
    [self setPlaceholderWithString:[Message messageWithKey:@"textfield.placeholder.state"]];
}

#pragma mark - public
-(NSString *)selectedValue {
    return [self.provider initialFromName:[self selectedTitle]];
}

-(NSString *)selectedTitle {
    return [[self.provider stateNames] objectAtIndex:[self selectedIndex]];
}

-(NSInteger)selectedIndex {
    return [self.pickerView selectedRowInComponent:0];
}

#pragma mark - UIPickerViewDataSource
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.provider.stateNames.count;
}

#pragma mark - UIPickerViewDelegate
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.provider.stateNames[row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.text = self.provider.stateNames[row];
    [self resignFirstResponder];
}

#pragma mark - setter
-(void)setPickerValue:(NSString *)initial {
    NSString *name = [self.provider nameFromInitial:initial];
    [self.textField setText:name];

    const NSInteger index = [self.provider.stateNames indexOfObject:name];
    [self.pickerView selectRow:index inComponent:0 animated:NO];
}

#pragma mark - getter
-(StateProvider *)provider {
    if (!_provider) {
        _provider = [[StateProvider alloc] init];
    }
    return _provider;
}
@end
