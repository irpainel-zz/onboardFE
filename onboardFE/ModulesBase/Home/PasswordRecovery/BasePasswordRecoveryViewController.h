//
//  LoginViewController.h
//  
//
//  Created by Taqtile on 11/30/15.
//  Copyright © 2015 Taqtile. All rights reserved.
//

#import "AppViewController.h"

@interface BasePasswordRecoveryViewController : AppViewController

- (NSString *)getEmail;
- (BOOL) isEmailValid;

#pragma mark - Abstract methods
- (IBAction)didTapSendButton:(id)sender;

@end
