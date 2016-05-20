//
//  SignupViewController.h
//  
//
//  Created by Taqtile on 11/30/15.
//  Copyright © 2015 Taqtile. All rights reserved.
//

#import "AppViewController.h"
#import "TQTCustomPickerView.h"

@interface BaseSignupViewController : AppViewController


@property(nonatomic, weak) IBOutlet TQTCustomPickerView *specialtyPickerView;

-(NSString *)getCPF;
-(NSString *)getName;
-(NSString *)getBirthDate;
-(NSString *)getCRM;
-(NSString *)getState;
-(NSString *)getPassword;
-(NSString *)getEmail;

- (BOOL)isFormValid;

#pragma mark - Abstract methods
- (IBAction)didTapButton:(id)sender;

#pragma mark - public methods (to be used by subclasses if necessary)
-(void)setSubmitButtonTitle:(NSString *)title;
-(void)setCPF:(NSString *)cpf;
-(void)setName:(NSString *)name;
-(void)setBirthDate:(NSString *)birthdate;
-(void)setCRM:(NSString *)crm;
-(void)setPassword:(NSString *)password;
-(void)setPasswordConfirmation:(NSString *)password;
-(void)setSpecialtyData:(NSArray *)specialtyData;
-(void)setEmail:(NSString *)email;
-(NSString *)selectedState;
-(void)setSelectedState:(NSString *)selectedState;

@end