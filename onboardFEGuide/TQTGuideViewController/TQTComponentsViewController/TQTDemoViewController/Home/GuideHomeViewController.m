//
//  GuideHomeViewController.m
//  
//
//  Created by Taqtile on 12/4/15.
//  Copyright © 2015 Taqtile. All rights reserved.
//

#import "Constants.h"
#import "GuideHomeViewController.h"
#import "GuideLoginViewController.h"
#import "BaseLoginViewController.h"

@interface GuideHomeViewController ()

@end

@implementation GuideHomeViewController
{
}

- (void)viewDidLoad {
    [super viewDidLoad];

    GuideLoginViewController *loginVC = [[GuideLoginViewController alloc] initWithNibName:NSStringFromClass(BaseLoginViewController.class) bundle:nil];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:loginVC];
    [self presentViewController:nav animated:YES completion:nil];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
