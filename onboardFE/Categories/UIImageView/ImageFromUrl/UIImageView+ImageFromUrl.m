//
//  UIImageView+ImageFromUrl.m
//  
//
//  Created by Indigo on 9/11/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "Colors.h"
#import "UIImage+ImageWithColor.h"
#import "UIImageView+AFNetworking.h"
#import "UIImageView+ImageFromUrl.h"


@implementation UIImageView (ImageFromUrl)

-(void)setImageViewWithImageFromUrl:(NSString *)urlString
{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    UIImage *placeholderImage = [UIImage imageWithColor:UICOLOR_FROM_HEX(COLOR_GRAY_LIGHTEST)];
    self.contentMode = UIViewContentModeScaleToFill;
    __weak __typeof(self)weakSelf = self;
    [self setImageWithURLRequest:request
                placeholderImage:placeholderImage
                         success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image){
                             __strong __typeof(weakSelf)strongSelf = weakSelf;
                             // Check if the image is not cached locally
                             strongSelf.contentMode = UIViewContentModeScaleAspectFit;
                             if (request) {
                                 strongSelf.alpha = 0;
                                 strongSelf.image = image;
                                 [strongSelf performFadeInForImageView:strongSelf withDuration:0.2];
                             } else {
                                 strongSelf.image = image;
                             }
                         }
                         failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error){
                             __strong __typeof(weakSelf)strongSelf = weakSelf;
                             strongSelf.image = placeholderImage;
                         }];
}

- (void)performFadeInForImageView:(UIImageView *)imageView withDuration:(double)seconds {

    [UIView beginAnimations:@"fade in" context:nil];
    [UIView setAnimationDuration:seconds];
    imageView.alpha = 1.0;
    [UIView commitAnimations];
}

@end
