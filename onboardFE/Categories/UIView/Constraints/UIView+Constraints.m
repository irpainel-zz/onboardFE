//
//  UIView+Constraints.m
//  
//
//  Created by Taqtile on 9/29/15.
//  Copyright © 2015 Taqtile. All rights reserved.
//

#import "UIView+Constraints.h"

@implementation UIView (Constraints)
-(NSLayoutConstraint *)constraintForAttribute:(NSLayoutAttribute)attribute {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"firstAttribute = %d && (firstItem = %@ || secondItem = %@)", attribute, self, self];
    NSArray *constraintArray = [self.superview constraints];

    if (attribute == NSLayoutAttributeWidth || attribute == NSLayoutAttributeHeight) {
        constraintArray = [self constraints];
    }

    NSArray *fillteredArray = [constraintArray filteredArrayUsingPredicate:predicate];
    if(fillteredArray.count == 0) {
        return nil;
    } else {
        return fillteredArray.firstObject;
    }
}

#pragma mark - getters
- (NSLayoutConstraint *)leftConstraint {
    return [self constraintForAttribute:NSLayoutAttributeLeft];
}

- (NSLayoutConstraint *)rightConstraint {
    return [self constraintForAttribute:NSLayoutAttributeRight];
}

- (NSLayoutConstraint *)topConstraint {
    return [self constraintForAttribute:NSLayoutAttributeTop];
}

- (NSLayoutConstraint *)bottomConstraint {
    return [self constraintForAttribute:NSLayoutAttributeBottom];
}

- (NSLayoutConstraint *)leadingConstraint {
    return [self constraintForAttribute:NSLayoutAttributeLeading];
}

- (NSLayoutConstraint *)trailingConstraint {
    return [self constraintForAttribute:NSLayoutAttributeTrailing];
}

- (NSLayoutConstraint *)widthConstraint {
    return [self constraintForAttribute:NSLayoutAttributeWidth];
}

- (NSLayoutConstraint *)heightConstraint {
    return [self constraintForAttribute:NSLayoutAttributeHeight];
}

- (NSLayoutConstraint *)centerXConstraint {
    return [self constraintForAttribute:NSLayoutAttributeCenterX];
}

- (NSLayoutConstraint *)centerYConstraint {
    return [self constraintForAttribute:NSLayoutAttributeCenterY];
}

- (NSLayoutConstraint *)baseLineConstraint {
    return [self constraintForAttribute:NSLayoutAttributeBaseline];
}

#pragma mark - setters
-(void)setHeightConstraintConstant:(NSUInteger)constant {
    self.translatesAutoresizingMaskIntoConstraints = NO;

    NSLayoutConstraint *heightConstraint = self.heightConstraint;

    if (heightConstraint) {
        heightConstraint.constant = constant;
    } else {
        heightConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:0 constant:constant];
        [self addConstraint:heightConstraint];
    }
}

-(void)setWidthConstraintConstant:(NSUInteger)constant {
    self.translatesAutoresizingMaskIntoConstraints = NO;

    NSLayoutConstraint *widthConstraint = self.widthConstraint;

    if (widthConstraint) {
        widthConstraint.constant = constant;
    } else {
        widthConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:0 constant:constant];
        [self addConstraint:widthConstraint];
    }

}
@end
