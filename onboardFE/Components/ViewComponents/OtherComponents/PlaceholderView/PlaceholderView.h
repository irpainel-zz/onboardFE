//
//  NoConnectionView.h
//
//  Created by I.ndigo on 5/8/14.
//  Copyright (c) 2014 Taqtile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TQTBaseComponentsView.h"

@class PlaceholderView;

@protocol PlaceholderViewDelegate <NSObject>

- (void)placeholderViewButtonTapped:(PlaceholderView*)placeholderView;

@end

@interface PlaceholderView : TQTBaseComponentsView

@property (weak,nonatomic) id<PlaceholderViewDelegate> delegate;

- (void) showOverView:(UIView *)view completion:(void (^)(BOOL finished))completion;
- (void)hidePlaceholderView;
- (instancetype)initWithFrame:(CGRect)frame
                        image:(UIImage*)image
                  buttonTitle:(NSString*)buttonTitle
                      message:(NSString*)message
                     delegate:(id<PlaceholderViewDelegate>)delegate;
- (void)setLabelAlignment:(NSTextAlignment)alignment;
-(void)setEnabled:(BOOL)isEnabled;
@end
