//
//  LoadingImageView.m
//  
//
//  Created by Taqtile on 12/4/15.
//  Copyright © 2015 Taqtile. All rights reserved.
//

#import "LoadingImageView.h"

#define ANIMATION_LOADING_SPEED 0.8

@implementation LoadingImageView

static NSString * const imageName = @"ic-loading";

-(void)awakeFromNib {
    [self initialSetup];
}

- (id)init
{
    if (self = [super initWithImage:[UIImage imageNamed:imageName]]) {
    }
    return self;
}

-(void)initialSetup {
    self.image = [UIImage imageNamed:imageName];
}

#pragma mark - UIScrollView+InfiniteScroll methods

-(void)startAnimating {
    [self rotateLayerInfiniteLayer:self.layer];
}

-(void)stopAnimating {
    [self.layer removeAllAnimations];
}


#pragma mark - circular animation
// http://stackoverflow.com/a/21207091
- (void)rotateLayerInfiniteLayer:(CALayer *)layer
{
    CABasicAnimation *rotation;
    rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotation.fromValue = [NSNumber numberWithFloat:0];
    rotation.toValue = [NSNumber numberWithFloat:(2 * M_PI)];
    rotation.duration = ANIMATION_LOADING_SPEED;
    rotation.repeatCount = HUGE_VALF;
    [layer removeAllAnimations];
    [layer addAnimation:rotation forKey:@"Spin"];
}
@end
