//
//  DemoViewController.m
//  
//
//  Created by Taqtile on 12/1/15.
//  Copyright © 2015 Taqtile. All rights reserved.
//

#import "TQTDemoViewController.h"
#import "TQTStylesheets.h"
#import "GuideLoginViewController.h"

@interface TQTDemoViewController ()

@end

@implementation TQTDemoViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Demo"];
}

#pragma mark - overriden method
- (void)addComponents {
    UIButton *buttonNotification = (UIButton *)[self addViewWithDefaultMarginsAndClass:[UIButton class] height:34];
    [[TQTStylesheets sharedInstance] setStyle:@"Primary_Button" forView:buttonNotification];
    [buttonNotification setTitle:@"Start" forState:UIControlStateNormal];
    [buttonNotification addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];

}

- (void)start {
    GuideLoginViewController * controller = [[GuideLoginViewController alloc] init];
    [self.navigationController presentViewController:controller animated:YES completion:nil];
}

@end
