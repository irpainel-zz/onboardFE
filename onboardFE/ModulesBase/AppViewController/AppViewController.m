//
//  AppViewController.m
//  
//
//  Created by Indigo on 8/19/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "AppViewController.h"
#import "AppDelegate.h"
#import "Colors.h"
#import "Components.h"
#import "TQTButtonStylesheet.h"
#import "UIImage+ImageWithAlpha.h"
#import "UIImage+ImageWithColor.h"
#import "Message.h"
#import "UIViewController+SetupNavbarButtonWithTitle.h"


@interface AppViewController ()

@end

@implementation AppViewController

- (id)init{
    self = [super init];
    if (self){
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad{
    [super viewDidLoad];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

#pragma mark - Getters
-(LoadingView *) loadingView {
    if(!_loadingView) {
        _loadingView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([LoadingView class]) owner:self options:nil] objectAtIndex:0];
    }
    return _loadingView;
}

-(NotificationView *)notificationView {
    if (!_notificationView) {
        _notificationView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([NotificationView class]) owner:self options:nil] objectAtIndex:0];
    }
    return _notificationView;
}

@end
