//
//  UIView+AttachToSuperview.m
///  
//
//  Created by Tqt iOS on 7/31/2015.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "UIView+TQTAttachToSuperview.h"

@implementation UIView (TQTAttachToSuperview)
-(void)attachToSuperviewUsingConstraints {
    self.translatesAutoresizingMaskIntoConstraints = NO;

    NSDictionary *viewsMapping = @{@"view": self};
    NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|" options:0 metrics:nil views:viewsMapping];
    NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:nil views:viewsMapping];

    [self.superview addConstraints:horizontalConstraints];
    [self.superview addConstraints:verticalConstraints];
}
@end
