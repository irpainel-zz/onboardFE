//
//  LoadingView.h
//  
//
//  Created by Taqtile on 5/16/14.
//  Copyright (c) 2014 Taqtile. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    LoadingViewStateHidden,
    LoadingViewStateLoading,
    LoadingViewStateMessage,
    LoadingViewStateAnimating,
} LoadingViewState;

@class LoadingView;

extern const float kLoadingViewMaxAlpha;

@protocol LoadingViewDelegate <NSObject>

@optional
-(void)loadingLoadingViewWillAppear;
-(void)loadingLoadingViewDidDisappear;

@end

@interface LoadingView : UIView

@property (weak, nonatomic) id<LoadingViewDelegate> delegate;

#pragma mark - Properties

@property LoadingViewState state;

#pragma mark - Methods

-(void)showWindowLoadingWithCompletion:(void (^)(BOOL finished))completion;
-(void)showLoadingOverView:(UIView *)view withCompletion:(void (^)(BOOL finished))completion;

- (void)hideLoadingWithDelay:(BOOL)delay;
- (void)hideLoadingWithDelay:(BOOL)delay completion:(void (^)(void))completion;

- (void)showLoadingOnStatusBar;
- (void)hideLoadingOnStatusBar;
@end

