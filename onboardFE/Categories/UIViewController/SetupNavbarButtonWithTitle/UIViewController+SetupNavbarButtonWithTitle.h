//
//  UIViewController+SetupNavbarButtonWithTitle.h
//  
//
//  Created by Taqtile on 12/16/15.
//  Copyright © 2015 Taqtile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (SetupNavbarButtonWithTitle)

-(void)setupRightNavbarButtonWithTittle:(NSString *)title target:(id)target action:(SEL)action;
-(void)setupLeftNavbarButtonWithTittle:(NSString *)title target:(id)target action:(SEL)action;
-(void)setupLeftNavbarCancelButtonWithTarget:(id)target action:(SEL)action;

@end
