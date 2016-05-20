//
//  UIView+Constraints.h
//  
//
//  Created by Taqtile on 9/29/15.
//  Copyright © 2015 Taqtile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Constraints)
- (NSLayoutConstraint *)constraintForAttribute:(NSLayoutAttribute)attribute;

- (NSLayoutConstraint *)leftConstraint;
- (NSLayoutConstraint *)rightConstraint;
- (NSLayoutConstraint *)topConstraint;
- (NSLayoutConstraint *)bottomConstraint;
- (NSLayoutConstraint *)leadingConstraint;
- (NSLayoutConstraint *)trailingConstraint;
- (NSLayoutConstraint *)widthConstraint;
- (NSLayoutConstraint *)heightConstraint;
- (NSLayoutConstraint *)centerXConstraint;
- (NSLayoutConstraint *)centerYConstraint;
- (NSLayoutConstraint *)baseLineConstraint;

-(void)setHeightConstraintConstant:(NSUInteger)constant;
-(void)setWidthConstraintConstant:(NSUInteger)constant;
@end
