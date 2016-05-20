//
//  TQTFormsViewController.m
//  onboardFE
//
//  Created by Tqt iOS on 5/20/2016.
//  Copyright (c) 2016 Taqtile. All rights reserved.
//

#import "Components.h"
#import "TQTCustomCheckboxButtonView.h"
#import "TQTCustomPickerView.h"
#import "TQTCustomRadioButtonView.h"
#import "TQTCustomTextfieldsViewController.h"
#import "TQTFormsViewController.h"
#import "TQTStylesheets.h"
#import "DatePickerView.h"
#import "StatePickerView.h"

@interface TQTFormsViewController ()

@end

@implementation TQTFormsViewController

#pragma mark - VC lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Forms"];
}

#pragma mark - overriden method
- (void)addComponents {
    [self addTextfield];
    [self addPickerView];
    [self addRadioButton];
    [self addCheckboxButton];
}

- (void)addTextfield {
    [self addGuideTitleWithText:NSStringFromClass(TQTCustomTextFieldView.class)];

    [self addComponentWithClass:[TQTCustomTextFieldView class] setup:^(UIView *componentView){
        [(TQTCustomTextFieldView *)componentView setState:TQTCustomTextFieldViewStateDefault];
    }];

    [self addComponentWithClass:[TQTCustomTextFieldView class] setup:^(UIView *componentView){
        TQTCustomTextFieldView *nameTextFieldView = (TQTCustomTextFieldView *)componentView;
        [nameTextFieldView.textField setText:@"Bob"];
        [nameTextFieldView setState:TQTCustomTextFieldViewStateHighlight];
    }];

    [self addComponentWithClass:[TQTCustomTextFieldView class] setup:^(UIView *componentView){
        TQTCustomTextFieldView *nameTextFieldView = (TQTCustomTextFieldView *)componentView;
        [nameTextFieldView.textField setText:@"Bob"];
        [nameTextFieldView setState:TQTCustomTextFieldViewStateInactive];
    }];

    [self addComponentWithClass:[TQTCustomTextFieldView class] setup:^(UIView *componentView){
        TQTCustomTextFieldView *nameTextFieldView = (TQTCustomTextFieldView *)componentView;
        [nameTextFieldView.textField setText:@"Bob"];
        [nameTextFieldView setState:TQTCustomTextFieldViewStateActive];
    }];

    [self addComponentWithClass:[TQTCustomTextFieldView class] setup:^(UIView *componentView){
        TQTCustomTextFieldView *nameTextFieldView = (TQTCustomTextFieldView *)componentView;
        [nameTextFieldView.textField setText:@"132n"];
        [nameTextFieldView setCaptionText:@"Erro."];
        [nameTextFieldView setState:TQTCustomTextFieldViewStateError];
    }];

    UIButton *button = (UIButton *)[self addViewWithDefaultMarginsAndClass:[UIButton class] height:BUTTON_HEIGHT];
    [[TQTStylesheets sharedInstance] setStyle:@"Primary_Button" forView:button];
    [button setTitle:@"Click to see custom textfields" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(customTextfields) forControlEvents:UIControlEventTouchUpInside];
}

- (void)addPickerView {
    [self addGuideTitleWithText:@"Picker"];

    [self addComponentWithClass:[TQTCustomPickerView class] setup:^(UIView *componentView){
        [(TQTCustomPickerView *)componentView setState:TQTCustomTextFieldViewStateDefault];
    }];

    [self addComponentWithClass:[TQTCustomPickerView class] setup:^(UIView *componentView){
        TQTCustomPickerView *customPickerView = (TQTCustomPickerView *)componentView;
        [customPickerView.textField setText:@"Bob"];
        [customPickerView setState:TQTCustomTextFieldViewStateHighlight];
    }];

    [self addComponentWithClass:[TQTCustomPickerView class] setup:^(UIView *componentView){
        TQTCustomPickerView *customPickerView = (TQTCustomPickerView *)componentView;
        [customPickerView.textField setText:@"Bob"];
        [customPickerView setState:TQTCustomTextFieldViewStateInactive];
    }];

    [self addComponentWithClass:[TQTCustomPickerView class] setup:^(UIView *componentView){
        TQTCustomPickerView *customPickerView = (TQTCustomPickerView *)componentView;
        [customPickerView.textField setText:@"Bob"];
        [customPickerView setState:TQTCustomTextFieldViewStateActive];
    }];

    [self addComponentWithClass:[TQTCustomPickerView class] setup:^(UIView *componentView){
        TQTCustomPickerView *customPickerView = (TQTCustomPickerView *)componentView;
        [customPickerView setState:TQTCustomTextFieldViewStateError];
    }];

    [self addComponentWithClass:[DatePickerView class] setup:^(UIView *componentView){
        DatePickerView *customPickerView = (DatePickerView *)componentView;
        [customPickerView fixDatePickerMode];
    }];

    [self addComponentWithClass:[StatePickerView class] setup:^(UIView *componentView){
        StatePickerView *customPickerView = (StatePickerView *)componentView;
    }];
}

- (void)addRadioButton {
    [self addGuideTitleWithText:@"Radio button"];

    [self addComponentWithClass:[TQTCustomRadioButtonView class] setup:nil];

    [self addComponentWithClass:[TQTCustomRadioButtonView class] setup:^(UIView *componentView){
        [(TQTCustomRadioButtonView *)componentView setSelected:YES];
    }];

    [self addComponentWithClass:[TQTCustomRadioButtonView class] setup:^(UIView *componentView){
        TQTCustomRadioButtonView *customRadioButtonView = (TQTCustomRadioButtonView *)componentView;
        [customRadioButtonView setSelected:NO];
        [customRadioButtonView setState:TQTCustomRadioButtonViewStateInactive];
    }];

    [self addComponentWithClass:[TQTCustomRadioButtonView class] setup:^(UIView *componentView){
        TQTCustomRadioButtonView *customRadioButtonView = (TQTCustomRadioButtonView *)componentView;
        [customRadioButtonView setSelected:YES];
        [customRadioButtonView setState:TQTCustomRadioButtonViewStateInactive];
    }];
}

- (void)addCheckboxButton {
    [self addGuideTitleWithText:@"Checkbox button"];

    [self addComponentWithClass:[TQTCustomCheckboxButtonView class] setup:nil];

    [self addComponentWithClass:[TQTCustomCheckboxButtonView class] setup:^(UIView *componentView){
        [(TQTCustomCheckboxButtonView *)componentView setSelected:YES];
    }];

    [self addComponentWithClass:[TQTCustomCheckboxButtonView class] setup:^(UIView *componentView){
        TQTCustomCheckboxButtonView *customRadioButtonView = (TQTCustomCheckboxButtonView *)componentView;
        [customRadioButtonView setSelected:NO];
        [customRadioButtonView setState:TQTCustomCheckboxButtonViewStateInactive];
    }];

    [self addComponentWithClass:[TQTCustomCheckboxButtonView class] setup:^(UIView *componentView){
        TQTCustomCheckboxButtonView *customRadioButtonView = (TQTCustomCheckboxButtonView *)componentView;
        [customRadioButtonView setSelected:YES];
        [customRadioButtonView setState:TQTCustomCheckboxButtonViewStateInactive];
    }];
}

#pragma mark - Aux methods
- (void)addComponentWithClass:(Class)class setup:(void (^)(UIView *componentView))setup {
     UIView *componentView = [self addViewWithDefaultMarginsAndClass:class height:0];
    if (setup) setup(componentView);
}

#pragma mark - Actions
-(void)customTextfields {
    [self.navigationController pushViewController:[[TQTCustomTextfieldsViewController alloc] initWithNibName:NSStringFromClass([TQTComponentsViewController class]) bundle:nil] animated:YES];
}
@end
