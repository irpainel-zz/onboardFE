//
//  LoadingImageView.h
//  
//
//  Created by Taqtile on 12/4/15.
//  Copyright © 2015 Taqtile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingImageView : UIImageView

// Implementing methods needed for UIScrollView+InfiniteScroll
// https://github.com/pronebird/UIScrollView-InfiniteScroll
// DO NOT CHANGE
-(void)startAnimating;
-(void)stopAnimating;

@end
