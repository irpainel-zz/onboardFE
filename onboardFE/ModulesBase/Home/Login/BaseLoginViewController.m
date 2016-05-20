//
//  LoginViewController.m
//  
//
//  Created by Taqtile on 11/30/15.
//  Copyright © 2015 Taqtile. All rights reserved.
//

#import "Message.h"
#import "BaseLoginViewController.h"
#import "EmailTextFieldView.h"
#import "PasswordTextFieldView.h"
#import "TQTMissingMethodImplementationException.h"
#import "UIImage+ImageWithColor.h"
#import "Colors.h"

@interface BaseLoginViewController () <UISearchBarDelegate>{
    __weak IBOutlet EmailTextFieldView *_emailTextField;
    __weak IBOutlet PasswordTextFieldView *_passwordTextField;
    __weak IBOutlet UIButton *_forgotPasswordButton;
    __weak IBOutlet UIButton *_loginButton;
    __weak IBOutlet UIButton *_signupButton;
}

@end

@implementation BaseLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialSetup];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initialSetup {
    [super setTitle:[Message messageWithKey:@"login.title"]];
}

- (NSString *)getEmail
{
    return [_emailTextField getText];
}

- (BOOL) isEmailValid
{
    return [_emailTextField isInputValid];
}

- (NSString *)getPassword
{
    return [_passwordTextField getText];
}

- (BOOL) isPasswordValid
{
    return [_passwordTextField isInputValid];
}

#pragma mark - buttons actions
- (IBAction)didTapForgotPasswordButton:(id)sender {
    @throw [[TQTMissingMethodImplementationException alloc] initWithSelector:_cmd];
}

- (IBAction)didTapLoginButton:(id)sender {
    @throw [[TQTMissingMethodImplementationException alloc] initWithSelector:_cmd];
}

- (IBAction)didTapSignupButton:(id)sender {
    @throw [[TQTMissingMethodImplementationException alloc] initWithSelector:_cmd];
}

@end
