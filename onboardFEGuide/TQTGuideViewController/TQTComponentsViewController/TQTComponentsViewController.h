//
// TQTComponentsViewController.h
//  onboardFE
//
//  Created by Tqt iOS on 5/20/2016.
//  Copyright (c) 2016 Taqtile. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * This is an abstract class which is used to show a component list view
 * (typography, colors etc). The implementation of this abstract class follow
 * this article: http://stackoverflow.com/a/1034464 .
 * Every component list view controller should inherit from this class and implement
 * the method `addComponents`, which is called on `viewDidLoad`.
 * Check the method `addComponents` on the implementation file for more info
 */
@interface TQTComponentsViewController : UIViewController
-(UIView *)addViewWithClass:(Class)class height:(CGFloat)height;
-(UIView *)addViewWithDefaultMarginsAndClass:(Class)class height:(CGFloat)height;
-(void)addGuideTitleWithText:(NSString *)title;
-(void)addGuideSubtitleWithText:(NSString *)subtitle;
@end
