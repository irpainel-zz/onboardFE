//
//  TQTOtherComponentsViewController.m
//  onboardFE
//
//  Created by Tqt iOS on 5/20/2016.
//  Copyright (c) 2016 Taqtile. All rights reserved.
//

#import "TQTOtherComponentsViewController.h"
#import "TQTStylesheets.h"
#import "LoadingView.h"
#import "Components.h"
#import "NotificationView.h"
#import "PlaceholderView.h"
#import "PlaceholderFactory.h"

@interface TQTOtherComponentsViewController ()

@property (nonatomic) LoadingView *loadingView;
@property (nonatomic) NotificationView *notificationView;

@end

@implementation TQTOtherComponentsViewController
#pragma mark - VC lifecycle
-(void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Other components"];
}

-(void)viewWillDisappear:(BOOL)animated {
    [self hideLoading];
}

#pragma mark - overriden method
- (void)addComponents {
    [self addGuideTitleWithText:NSStringFromClass([LoadingView class])];

    [self addButtonWithTitle:@"Show status bar loading" selector:@selector(showStatusBarLoading)];
    [self addButtonWithTitle:@"Show window loading" selector:@selector(showWindowLoading)];
    [self addButtonWithTitle:@"Show loading over this view" selector:@selector(showLoading)];
    [self addButtonWithTitle:@"Hide loading" selector:@selector(hideLoading)];


    [self addGuideTitleWithText:NSStringFromClass([NotificationView class])];

    [self addButtonWithTitle:@"Info notification" selector:@selector(showInfoNotification)];
    [self addButtonWithTitle:@"Error notification" selector:@selector(showErrorNotification)];
    [self addButtonWithTitle:@"Success notification" selector:@selector(showSuccessNotification)];


    [self addGuideTitleWithText:NSStringFromClass([PlaceholderView class])];

    [self addButtonWithTitle:@"Work in progress placeholder" selector:@selector(showWIPPlaceholder)];
    [self addButtonWithTitle:@"No connection placeholder" selector:@selector(showNoConnectionPlaceholder)];
    [self addButtonWithTitle:@"No product found placeholder" selector:@selector(showNoProductFoundPlaceholder)];
}

#pragma mark - private
-(void)addButtonWithTitle:(NSString *)title selector:(SEL)selector {
    UIButton *button= (UIButton *)[self addViewWithDefaultMarginsAndClass:[UIButton class] height:BUTTON_HEIGHT];
    [[TQTStylesheets sharedInstance] setStyle:@"Primary_Button" forView:button];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - Placeholder
-(void)showWIPPlaceholder {
    PlaceholderView *placeholder = [[PlaceholderFactory sharedInstance] workInProgressPlaceholder];
    [placeholder showOverView:self.view completion:nil];
}

-(void)showNoConnectionPlaceholder {
    PlaceholderView *placeholder = [[PlaceholderFactory sharedInstance] noConnectionPlaceholderWithDelegate:self];
    [placeholder showOverView:self.view completion:nil];
}

-(void)showNoProductFoundPlaceholder {
    PlaceholderView *placeholder = [[PlaceholderFactory sharedInstance] noProductFoundPlaceholder];
    [placeholder showOverView:self.view completion:nil];
}

-(void)placeholderViewButtonTapped:(PlaceholderView *)placeholderView {
    [placeholderView hidePlaceholderView];
}

#pragma mark - Notification
-(void)showErrorNotification {
    [self.notificationView showNotificationErrorWithMsg:@"Ops, algo deu errado!" overView:self.view];
}

-(void)showSuccessNotification {
    [self.notificationView showNotificationSuccessWithMsg:@"Tarefa realizada com sucesso!" overView:self.view];
}

-(void)showInfoNotification {
    [self.notificationView showNotificationInfoWithMsg:@"Sem conexão com a internet." overView:self.view];
}

-(NotificationView *)notificationView {
    if (!_notificationView) {
        _notificationView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([NotificationView class]) owner:self options:nil] objectAtIndex:0];
    }
    return _notificationView;
}

#pragma mark - Loading
- (void)showWindowLoading {
    [self.loadingView showWindowLoadingWithCompletion:^(BOOL finished) {
        NSLog(@"did show loading");
    }];
}

- (void)showLoading {
    [self.loadingView showLoadingOverView:self.view withCompletion:^(BOOL finished) {
        NSLog(@"did show loading");
    }];
}

- (void)showStatusBarLoading {
    [self.loadingView showLoadingOnStatusBar];
}

- (void)hideLoading {
    [self.loadingView hideLoadingWithDelay:NO];
}

-(LoadingView *)loadingView {
    if (!_loadingView) {
        _loadingView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([LoadingView class]) owner:self options:nil] objectAtIndex:0];
    }
    return _loadingView;
}
@end
