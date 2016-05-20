//
//  GuideLoginViewController.m
//  
//
//  Created by Taqtile on 12/1/15.
//  Copyright © 2015 Taqtile. All rights reserved.
//

#import "GuideLoginViewController.h"
#import "GuidePasswordRecoveryViewController.h"
#import "GuideSignupViewController.h"
#import "GuideHomeViewController.h"

@interface GuideLoginViewController ()

@end

@implementation GuideLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - Overriden methods
- (IBAction)didTapForgotPasswordButton:(id)sender {
    UIViewController *vc = [[GuidePasswordRecoveryViewController alloc] initWithNibName:NSStringFromClass([BasePasswordRecoveryViewController class]) bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)didTapLoginButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)didTapSignupButton:(id)sender {
    UIViewController *vc = [[GuideSignupViewController alloc] initWithNibName:NSStringFromClass([BaseSignupViewController class]) bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
