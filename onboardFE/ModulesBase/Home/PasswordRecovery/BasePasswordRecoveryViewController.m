//
//  SignupViewController.m
//  
//
//  Created by Taqtile on 11/30/15.
//  Copyright © 2015 Taqtile. All rights reserved.
//

#import "Message.h"
#import "BasePasswordRecoveryViewController.h"
#import "EmailTextFieldView.h"
#import "PasswordTextFieldView.h"
#import "TQTMissingMethodImplementationException.h"

@interface BasePasswordRecoveryViewController () {
    __weak IBOutlet EmailTextFieldView *_emailTextField;
    __weak IBOutlet UIButton *_sendButton;
}

@end

@implementation BasePasswordRecoveryViewController

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
    [super setTitle:[Message messageWithKey:@"password_recovery.title"]];
}

-(NSString *)getEmail {
    return [_emailTextField getText];
}

- (BOOL)isEmailValid {
    return [_emailTextField isInputValid];
}

#pragma mark - buttons actions
- (IBAction)didTapSendButton:(id)sender {
    @throw [[TQTMissingMethodImplementationException alloc] initWithSelector:_cmd];
}
@end
