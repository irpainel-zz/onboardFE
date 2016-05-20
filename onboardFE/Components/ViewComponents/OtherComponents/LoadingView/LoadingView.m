//
//  LoadingView.m
//  
//
//  Created by Taqtile on 5/16/14.
//  Copyright (c) 2014 Taqtile. All rights reserved.
//

#import "LoadingView.h"
#import "Fonts.h"
#import "TQTStylesheets.h"
#import "Colors.h"
#import "UIView+TQTAttachToSuperview.h"
#import "UIView+CenterInParent.h"
#import "UIView+Constraints.h"

@interface LoadingView ()

@property (strong, nonatomic) UIWindow * window;
@property (strong, nonatomic) UIView * overlayView;

@end

@implementation LoadingView
{
    NSUInteger _defaultOriginX;
    NSUInteger _defaultOriginY;
    UIView     *_containerView;

    __weak IBOutlet UIImageView *_loadingView;

}

#define MAX_SCALE 1.2
#define MIN_SCALE 0.8

#define ANIMATION_FADE_IN_DURATION 0.3
#define ANIMATION_DELAY_DURATION 2
#define ANIMATION_FADE_OUT_DURATION 0.3

#define DEFAULT_SIZE 42

const float kLoadingViewMaxAlpha = 1;

#pragma mark - View lifecycle
- (void)awakeFromNib {
    [super awakeFromNib];

    [self initialSetup];
}

- (void)initialSetup {
    _state = LoadingViewStateHidden;
}

#pragma mark - show loading
-(void)showWindowLoadingWithCompletion:(void (^)(BOOL finished))completion {
    [[TQTStylesheets sharedInstance] setStyle:@"LoadingView_View" forView:self];
    _containerView = self.window;
    [self showLoadingWithCompletion:completion];
}

-(void)showLoadingOverView:(UIView *)view withCompletion:(void (^)(BOOL finished))completion{
    _containerView = view;
    [self addOverlay];
    [self showLoadingWithCompletion:completion];
}

-(void)showLoadingWithCompletion:(void (^)(BOOL finished))completion {
    if (self.state == LoadingViewStateHidden) {
        [self beforeShowLoading];

        self.state = LoadingViewStateAnimating;
        [self setupDefaultSize];
        [UIView animateWithDuration:ANIMATION_FADE_IN_DURATION delay:0.0  options:UIViewAnimationOptionCurveEaseInOut  animations:^{
            self.alpha = kLoadingViewMaxAlpha;
            [self layoutIfNeeded];
        } completion:^(BOOL finished) {
            if (completion) {
                completion(finished);
            }
        }];
    }
    self.state = LoadingViewStateLoading;
}

- (void)beforeShowLoading {
    if (!_containerView) {
        [self throwInvalidContainerViewException];
    }
    
    if ([self.delegate respondsToSelector:@selector(loadingLoadingViewWillAppear)]) {
        [self.delegate loadingLoadingViewWillAppear];
    }
    [_loadingView startAnimating];
    self.alpha = 0;
    _loadingView.alpha = 1;

    [_containerView addSubview:self];
    [self setupBeforeShowLoadingConstraints];
}

- (void)setupBeforeShowLoadingConstraints {
    [self setupExpandedSize];
    [self centerInParent];
    [self layoutIfNeeded];
}

-(void)addOverlay{
    if (!_containerView) {
        [self throwInvalidContainerViewException];
    }
    
    self.overlayView = [[UIView alloc] initWithFrame:CGRectZero];
    [[TQTStylesheets sharedInstance] setStyle:@"LoadingView_Is_OverView_View" forView:self];
    [[TQTStylesheets sharedInstance] setStyle:@"LoadingView_Overlay_View" forView:self.overlayView];

    [_containerView addSubview:self.overlayView];
    [self.overlayView attachToSuperviewUsingConstraints];
}

- (void)throwInvalidContainerViewException {
    @throw [[NSException alloc] initWithName:@"LoadingViewInvalidContainer" reason:@"The container of LoadingView should be defined" userInfo:nil];
}

#pragma mark - hide notification
- (void)hideLoadingWithDelay:(BOOL)delay {
    [self hideLoadingWithDelay:delay completion:nil];
}

- (void)hideLoadingWithDelay:(BOOL)delay
                       completion:(void (^)(void))completion{
    float animationDuration = delay ? ANIMATION_DELAY_DURATION : 0;
    [self layoutIfNeeded];

    self.state = LoadingViewStateAnimating;
    [self setupContractedSize];
    [UIView animateWithDuration:ANIMATION_FADE_OUT_DURATION delay:animationDuration options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.alpha = 0;
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        self.state = LoadingViewStateHidden;
        if ([self.delegate respondsToSelector:@selector(loadingLoadingViewDidDisappear)]) {
            [self.delegate loadingLoadingViewDidDisappear];
        }
        [self hideLoadingOnStatusBar];
        [self removeFromSuperview];
        [self.overlayView removeFromSuperview];
        if (completion) {
            completion();
        }
    }];
}

#pragma mark - Load view size constraints setup
- (void)setupContractedSize
{
    [self setWidthConstraintConstant:DEFAULT_SIZE * MIN_SCALE];
    [self setHeightConstraintConstant:DEFAULT_SIZE * MIN_SCALE];
}

- (void)setupDefaultSize {
    [self setWidthConstraintConstant:DEFAULT_SIZE];
    [self setHeightConstraintConstant:DEFAULT_SIZE];
}

- (void)setupExpandedSize {
    [self setWidthConstraintConstant:DEFAULT_SIZE * MAX_SCALE];
    [self setHeightConstraintConstant:DEFAULT_SIZE * MAX_SCALE];
}

#pragma mark - Status bar loading
-(void)showLoadingOnStatusBar{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}

-(void)hideLoadingOnStatusBar{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

#pragma mark - getter
-(UIWindow *)window {
    if (!_window) {
        _window = [[UIApplication sharedApplication] keyWindow];
    }
    return _window;
}
@end
