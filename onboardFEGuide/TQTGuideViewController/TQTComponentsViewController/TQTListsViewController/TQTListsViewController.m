//
//  TQTListsViewController.m
//  onboardFE
//
//  Created by Tqt iOS on 5/20/2016.
//  Copyright (c) 2016 Taqtile. All rights reserved.
//

#import "Components.h"
#import "TQTListsViewController.h"
#import "TQTStylesheets.h"
#import "TQTTableViewController.h"

@interface TQTListsViewController ()

@end

@implementation TQTListsViewController

#pragma mark - overriden method
- (void)addComponents {
    [self addButtonWithTitle:@"TableView Cell examples" selector:@selector(showTableView)];
}

#pragma mark - Action
-(void)showTableView {
    [self.navigationController pushViewController:[[TQTTableViewController alloc] init] animated:YES];
}

#pragma mark - Utility method
-(void) addButtonWithTitle:(NSString *)title selector:(SEL)selector{
    UIButton *button = (UIButton *)[self addViewWithDefaultMarginsAndClass:[UIButton class] height:BUTTON_HEIGHT];
    [[TQTStylesheets sharedInstance] setStyle:@"Primary_Button" forView:button];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
}

@end
