//
//  LoginViewController.h
//  
//
//  Created by Taqtile on 11/30/15.
//  Copyright © 2015 Taqtile. All rights reserved.
//

#import "AppViewController.h"

@interface BaseLoginViewController : AppViewController

- (NSString *)getEmail;
- (BOOL) isEmailValid;
- (NSString *)getPassword;
- (BOOL) isPasswordValid;

#pragma mark - Abstract methods
- (IBAction)didTapForgotPasswordButton:(id)sender;
- (IBAction)didTapLoginButton:(id)sender;
- (IBAction)didTapSignupButton:(id)sender;
@end
