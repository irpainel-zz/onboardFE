//
//  TQTBaseComponentsView.h
//  onboardFE
//
//  Created by Tqt iOS on 5/20/2016.
//  Copyright (c) 2016 Taqtile. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * Base class of all view components. It basically loads the nib using the
 * class name or using the method `nibName` (which can be implemented in case
 * your component doesn't have a xib). Then it adds the loaded nib as a subview
 * (using constraints) of the view
 * Pay attention to this: the component class (which inherits from BaseComponentsView)
 * is actually the superview of its nib.
 */
@interface TQTBaseComponentsView : UIView

-(void) addContentViewWithConstraints;

#pragma mark - Abstract methods
-(void)setupOnInitWithFrame;
-(void)setupOnInitWithCoder;
-(NSString *)nibName;

@end
