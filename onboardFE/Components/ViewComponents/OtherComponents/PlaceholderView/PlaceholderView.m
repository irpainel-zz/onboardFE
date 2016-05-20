//
//  PlaceholderView.h
//
//  Created by I.ndigo on 5/8/14.
//  Copyright (c) 2014 Taqtile. All rights reserved.
//

#import "PlaceholderView.h"
#import "UIView+TQTAttachToSuperView.h"
#import "TQTStylesheets.h"


@implementation PlaceholderView {
    IBOutlet UIButton *_button;
    IBOutlet UIImageView *_image;
    IBOutlet UILabel *_label;
    __weak IBOutlet NSLayoutConstraint *_containerAlignmentYConstraint;
}

- (void)setupOnInitWithCoder {
}

- (void)setupOnInitWithFrame {
}

- (instancetype)initWithFrame:(CGRect)frame
                        image:(UIImage*)image
                  buttonTitle:(NSString*)buttonTitle
                      message:(NSString*)message
                     delegate:(id<PlaceholderViewDelegate>)delegate{

    self = [super initWithFrame:frame];

    if (self){
        _delegate = delegate;
        _image.image = image;
        _label.text = message;
        [_button setTitle:buttonTitle forState:UIControlStateNormal];

        if (buttonTitle.length > 0){
            [_button setHidden:NO];
        }
        else{
            [_button setHidden:YES];
        }
    }

    return self;
}

- (void) showOverView:(UIView *)view completion:(void (^)(BOOL finished))completion{
    [view addSubview:self];
    [self attachToSuperviewUsingConstraints];
    [self showPlaceholderAnimatedCompletion:^(BOOL finished) {
        if (completion){
            completion(finished);
        }
    }];
}

- (void)setLabelAlignment:(NSTextAlignment)alignment {
    [_label setTextAlignment:alignment];
}

#pragma mark - private
- (void)hidePlaceholderView {
    [UIView animateWithDuration:0.2 animations:^() {
        self.alpha = 0;
    } completion:^(BOOL finished){
        [self removeFromSuperview];
    }];
}

- (void)showPlaceholderAnimatedCompletion:(void (^)(BOOL finished))completion{
    self.alpha = 0;

    self.hidden = NO;

    [UIView animateWithDuration:0.2 animations:^() {
        self.alpha = 1;
    } completion:^(BOOL finished){
        if (completion){
            completion(finished);
        }
    }];
}

-(void)setEnabled:(BOOL)isEnabled {
    [_button setEnabled:isEnabled];
}

#pragma mark - UIButton
- (IBAction)btnPlaceholderTapped:(id)sender {

    if (_delegate && [_delegate respondsToSelector:@selector(placeholderViewButtonTapped:)]){
        [_delegate placeholderViewButtonTapped:self];
    }
}
@end
