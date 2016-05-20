//
//  GuideSignupViewController.m
//  
//
//  Created by Taqtile on 12/2/15.
//  Copyright © 2015 Taqtile. All rights reserved.
//

#import "GuideSignupViewController.h"
#import "GuideLoginViewController.h"

@interface GuideSignupViewController ()

@end

@implementation GuideSignupViewController

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
- (IBAction)didTapButton:(id)sender {
    UIViewController *vc = [[GuideLoginViewController alloc] initWithNibName:NSStringFromClass([BaseLoginViewController class]) bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
