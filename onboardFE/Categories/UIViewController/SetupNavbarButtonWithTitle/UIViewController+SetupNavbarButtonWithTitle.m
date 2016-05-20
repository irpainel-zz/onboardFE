//
//  UIViewController+SetupNavbarButtonWithTitle.m
//  
//
//  Created by Taqtile on 12/16/15.
//  Copyright © 2015 Taqtile. All rights reserved.
//

#import "UIViewController+SetupNavbarButtonWithTitle.h"
#import "TQTButtonStylesheet.h"

@implementation UIViewController (SetupNavbarButtonWithTitle)

-(void)setupRightNavbarButtonWithTittle:(NSString *)title target:(id)target action:(SEL)action {
    [self.navigationItem setRightBarButtonItem:[self barButtonItemWithTitle:title
                                                                    target:target
                                                                     action:action]
                                      animated:YES];
}

-(void)setupLeftNavbarButtonWithTittle:(NSString *)title target:(id)target action:(SEL)action {
    [self.navigationItem setLeftBarButtonItem:[self barButtonItemWithTitle:title
                                                                    target:target
                                                                    action:action]
                                     animated:YES];
}

-(void)setupLeftNavbarCancelButtonWithTarget:(id)target action:(SEL)action {
    [self.navigationItem setLeftBarButtonItem:[self cancelBarButtonWithTarget:target action:action] animated:YES];
}


-(UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)action {
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:title
                                                                 style:UIBarButtonItemStylePlain
                                                                target:target
                                                                action:action];
    [button setTitleTextAttributes:[TQTButtonStylesheet attributedStringAttributes][@"Navbar_Button_BarButton"] forState:UIControlStateNormal];
    return button;
}

-(UIBarButtonItem *)cancelBarButtonWithTarget:(id)target action:(SEL)action {
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ic-close"] style:UIBarButtonItemStylePlain target:target action:action];
    return button;
}

@end
