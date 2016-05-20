//
//  AppViewController.h
//  
//
//  Created by Indigo on 8/19/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoadingView.h"
#import "NotificationView.h"
#import "UINavigationItem+Title.h"

@interface AppViewController : UIViewController

@property(strong, nonatomic) NotificationView *notificationView;
@property(strong, nonatomic) LoadingView *loadingView;

@end
