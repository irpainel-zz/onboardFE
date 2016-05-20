//
//  LoginViewController.m
//  
//
//  Created by Taqtile on 11/30/15.
//  Copyright © 2015 Taqtile. All rights reserved.
//

#import "Message.h"
#import "BaseSignupViewController.h"
#import "EmailTextFieldView.h"
#import "PasswordTextFieldView.h"
#import "NameTextFieldView.h"
#import "CPFTextFieldView.h"
#import "TQTMissingMethodImplementationException.h"
#import "ConfirmPasswordTextFieldView.h"
#import "DatePickerView.h"
#import "UIView+Constraints.h"
#import "BasePickerViewManager.h"
#import "StatePickerView.h"

@interface BaseSignupViewController () {
    __weak IBOutlet CPFTextFieldView *_CPFTextFieldView;
    __weak IBOutlet NameTextFieldView *_nameTextFieldView;
    __weak IBOutlet DatePickerView *_birthDatePickerView;
    __weak IBOutlet PasswordTextFieldView *_passwordTextFieldView;
    __weak IBOutlet ConfirmPasswordTextFieldView *_confirmPasswordTextFieldView;
    __weak IBOutlet EmailTextFieldView *_emailTextFieldView;
    __weak IBOutlet UIButton *_button;
    
}

@property (nonatomic, strong) BasePickerViewManager *basePickerViewManager;

@end

@implementation BaseSignupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialSetup];
    [self setupSpecialtyPicker];
    // Do any additional setup after loading the view from its nib.
}

- (void)setupSpecialtyPicker {
    [_specialtyPickerView setLabelString:[Message messageWithKey:@"textfield.label.speciality"]];
    [_specialtyPickerView setPlaceholderWithString:[Message messageWithKey:@"textfield.label.speciality"]];
    [_specialtyPickerView setRequired:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initialSetup {
    [super setTitle:[Message messageWithKey:@"signup.title"]];
}

-(NSString *)getCPF {
    return [_CPFTextFieldView getFormattedCpf];
}

-(NSString *)getName {
    return [_nameTextFieldView getText];
}

-(NSString *)getBirthDate {
    return [_birthDatePickerView getText];
}

-(NSString *)getPassword {
    return [_passwordTextFieldView getText];
}

-(NSString *)getEmail {
    return [_emailTextFieldView getText];
}

-(BOOL)isFormValid {
    [_confirmPasswordTextFieldView validateIfEqualTo:_passwordTextFieldView];
    
    return [_CPFTextFieldView isInputValid] && [_nameTextFieldView isInputValid] && [_birthDatePickerView isInputValid] && [_passwordTextFieldView isInputValid] && [_confirmPasswordTextFieldView isInputValid] && [_emailTextFieldView isInputValid] && [_confirmPasswordTextFieldView isEqualTo:_passwordTextFieldView] && [_specialtyPickerView isInputValid];
}

// ATTENTION! This method may be necessary on the integration phase.
// Check with PO if we'll need to show all textfields or hide some of them
-(void)hideSpecialityAndBirthdate {
    [self removeField:_specialtyPickerView];
    [self removeField:_birthDatePickerView];
}

#pragma mark - public methods (to be used by subclasses if necessary)
-(void)setSubmitButtonTitle:(NSString *)title {
    [_button setTitle:title forState:UIControlStateNormal];
}

-(void)setCPF:(NSString *)cpf {
    [_CPFTextFieldView setText:cpf silent:YES];
}

-(void)setName:(NSString *)name {
    [_nameTextFieldView setText:name silent:YES];
}

-(void)setBirthDate:(NSString *)birthdate {
    [_birthDatePickerView setDateFromString:birthdate];
}

-(void)setPassword:(NSString *)password {
    [_passwordTextFieldView setText:password silent:YES];
}

-(void)setPasswordConfirmation:(NSString *)password {
    [_confirmPasswordTextFieldView setText:password silent:YES];
}

-(void)setSpecialtyData:(NSArray *)specialtyData {
    [self.basePickerViewManager setData:specialtyData];
}

-(void)setEmail:(NSString *)email {
    [_emailTextFieldView setText:email silent:YES];
}

#pragma mark - Getter 
-(BasePickerViewManager *)basePickerViewManager {
    if (!_basePickerViewManager) {
        _basePickerViewManager = [[BasePickerViewManager alloc] initWithPickerView:_specialtyPickerView];
    }
    return _basePickerViewManager;
}

#pragma mark - private method
-(void)removeField:(TQTCustomTextFieldView *)field {
    [field setHeightConstraintConstant:0];
    field.topConstraint.constant = 0;
    [field setHidden:YES];
    [field setState:TQTCustomTextFieldViewStateInactive];
}

#pragma mark - buttons actions
- (IBAction)didTapButton:(id)sender {
    @throw [[TQTMissingMethodImplementationException alloc] initWithSelector:_cmd];
}
@end
