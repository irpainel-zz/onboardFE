//
//  NotificationView.m
//  
//
//  Created by Taqtile on 5/16/14.
//  Copyright (c) 2014 Taqtile. All rights reserved.
//

#import "NotificationView.h"
#import "TQTStylesheets.h"
#import "Message.h"
#import "Components.h"
#import "UIView+Constraints.h"

@implementation NotificationView
{
    UIView *_parentView;
    NSLayoutConstraint *_bottomConstraint;
}

#pragma mark - public methods
- (void)showNotificationInfoWithMsg:(NSString*)msg overView:(UIView *)view{
    if (!_animating){
        [self setInfoMsg:msg];
        [self showNotificationOverView:view];
    }
}

- (void)showNotificationSuccessWithMsg:(NSString*)msg overView:(UIView *)view{
    if (!_animating){
        [self setSuccessMsg:msg];
        [self showNotificationOverView:view];
    }
}

- (void)showNotificationErrorWithMsg:(NSString*)msg overView:(UIView *)view{
    if (!_animating){
        [self setErrorMsg:msg];
        [self showNotificationOverView:view];
    }
}

#pragma mark - Actions
- (IBAction)didTouchUpInside:(id)sender {
    [self fadeOut];
}

- (void)fadeOut {
    [UIView animateWithDuration:ANIMATION_IMAGE_FADE_IN_DURATION animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        _animating = NO;
        self.alpha = 1;
    }];
}

#pragma mark - private methods
- (void) showNotificationOverView:(UIView *)view {
    if (!_animating){
        _parentView = view;

        _animating = YES;

        [_parentView addSubview:self];

        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSDictionary *viewsMapping = @{@"view": self, @"parent": _parentView};
        NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-15-[view]-15-|" options:0 metrics:nil views:viewsMapping];
        _bottomConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_parentView attribute:NSLayoutAttributeTop multiplier:1 constant:0];

        [self.superview addConstraints:horizontalConstraints];
        [self.superview addConstraint:_bottomConstraint];

        [self animateOverStatusBar];
    }
}

- (void)animateOverStatusBar {
    [_parentView layoutIfNeeded];
    NSLog(@"%f %f", self.frame.size.height, self.bottomConstraint.constant);
    [_bottomConstraint setConstant:(self.frame.size.height + MEDIUM_MARGIN)];
    [UIView animateWithDuration:1.0 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:0.2  options:UIViewAnimationOptionTransitionNone | UIViewAnimationOptionAllowUserInteraction animations:^{
        [_parentView layoutIfNeeded];
    } completion:^(BOOL finished){
        [_bottomConstraint setConstant:(self.frame.size.height + LARGE_MARGIN)];
        [UIView animateWithDuration:0.2 delay:2 options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionAllowUserInteraction animations:^{
            [_parentView layoutIfNeeded];
        } completion:^(BOOL finished) {
            [_bottomConstraint setConstant:0];
            [UIView animateWithDuration:0.2 delay:0.05 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                [_parentView layoutIfNeeded];
            } completion:^(BOOL finished) {
                [self removeFromSuperview];
                _animating = NO;
            }];
        }];
    }];
}

#pragma mark Label setters
- (void)setErrorMsg:(NSString*)msg{
    [_img setImage:[[UIImage imageNamed:@"ic-error"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    _lblMessage.text = msg;
    [[TQTStylesheets sharedInstance] setStyle:@"NotificationView_Container_Type_Error_View" forView:self];
}

- (void)setSuccessMsg:(NSString*)msg{
    [_img setImage:[[UIImage imageNamed:@"ic-check"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    _lblMessage.text = msg;
    [[TQTStylesheets sharedInstance] setStyle:@"NotificationView_Container_Type_Success_View" forView:self];
}

- (void)setInfoMsg:(NSString*)msg{
    [_img setImage:[[UIImage imageNamed:@"ic-error"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    _lblMessage.text = msg;
    [[TQTStylesheets sharedInstance] setStyle:@"NotificationView_Container_Type_Info_View" forView:self];
}

@end