//
//  UIView+CenterInParent.m
//  
//
//  Created by Taqtile on 11/27/15.
//  Copyright © 2015 Taqtile. All rights reserved.
//

#import "UIView+CenterInParent.h"

@implementation UIView (CenterInParent)
-(void)centerInParent {
    self.translatesAutoresizingMaskIntoConstraints = NO;

    NSLayoutConstraint *centerX = [NSLayoutConstraint constraintWithItem:self.superview attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:self.superview attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];

    [self.superview addConstraint:centerX];
    [self.superview addConstraint:centerY];
}
@end
