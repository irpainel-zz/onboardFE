//
//  NotificationView.h
//  
//
//  Created by Taqtile on 5/16/14.
//  Copyright (c) 2014 Taqtile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotificationView : UIView

#pragma mark - IBOutlets

@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *lblMessage;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint * contraintAlignment;

#pragma mark - Properties

@property BOOL animating;

#pragma mark - Methods

- (void)showNotificationInfoWithMsg:(NSString*)msg overView:(UIView *)view;
- (void)showNotificationSuccessWithMsg:(NSString*)msg overView:(UIView *)view;
- (void)showNotificationErrorWithMsg:(NSString*)msg overView:(UIView *)view;
@end
