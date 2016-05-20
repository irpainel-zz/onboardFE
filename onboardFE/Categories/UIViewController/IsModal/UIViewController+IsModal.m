//
//  UIViewController+IsModal.m
//  
//
//  Created by Taqtile on 10/23/15.
//  Copyright © 2015 Taqtile. All rights reserved.
//

#import "UIViewController+IsModal.h"

@implementation UIViewController (IsModal)

- (BOOL)isModal {
    return self.presentingViewController.presentedViewController == self
    || (self.navigationController != nil && self.navigationController.presentingViewController.presentedViewController == self.navigationController)
    || [self.tabBarController.presentingViewController isKindOfClass:[UITabBarController class]];
}

@end
