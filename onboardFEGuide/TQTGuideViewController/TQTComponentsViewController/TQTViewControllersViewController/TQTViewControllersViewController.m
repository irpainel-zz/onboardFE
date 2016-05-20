//
//  TQTViewControllersViewController.m
//  
//
//  Created by Taqtile on 8/28/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "Components.h"
#import "TQTStylesheets.h"
#import "TQTViewControllersViewController.h"
#import "BaseLoginViewController.h"
#import "BasePasswordRecoveryViewController.h"
#import "BaseSignupViewController.h"
#import "BaseHomeViewController.h"

/*
 * Every view controller that is added here should have its Base and Guide version.
 * For instance, BaseLoginViewController and GuideLoginViewController
 */
@interface TQTViewControllersViewController ()

@end

@implementation TQTViewControllersViewController

#pragma mark - ViewController lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem.backBarButtonItem setTitle:@"Voltar"];
}

#pragma mark - Overriden methods
- (void)addComponents {
    [self addSprint1];
}

-(void)addSprint1 {
    [self addGuideTitleWithText:@"Sprint #1"];

    NSArray *classes = @[
                         BaseHomeViewController.class,
                         BaseLoginViewController.class,
                         BasePasswordRecoveryViewController.class,
                         BaseSignupViewController.class,
                         ];

    [self addButtonsWithClassArray:classes];

}

#pragma mark - Button helper
-(void) addButtonsWithClassArray:(NSArray *)classes {
    for (Class class in classes) {
        [self addButtonWithClass:class];
    }
}

-(void) addButtonWithClass:(Class)class {
    [self addButtonWithTitle:[self titleFromViewControllerClass:class]selector:@selector(showViewController:)];
}

-(void) addButtonWithTitle:(NSString *)title selector:(SEL)selector{
    UIButton *button = (UIButton *)[self addViewWithDefaultMarginsAndClass:[UIButton class] height:BUTTON_HEIGHT];
    [[TQTStylesheets sharedInstance] setStyle:@"Primary_Button" forView:button];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
}

-(NSString *)titleFromViewControllerClass:(Class)class {
    const NSString *name = NSStringFromClass(class);
    const NSString *nameWithoutSuffix = [name stringByReplacingOccurrencesOfString:@"ViewController" withString:@""];
    NSString *nameWithoutPrefix = [nameWithoutSuffix stringByReplacingOccurrencesOfString:@"Base" withString:@""];
    return nameWithoutPrefix;
}

#pragma mark - show methods
-(void)showViewController:(UIButton *)sender {
    NSString *baseClassString = [@"Base" stringByAppendingString:[sender.titleLabel.text stringByAppendingString:@"ViewController"]];
    NSString *guideClassString = [@"Guide" stringByAppendingString:[sender.titleLabel.text stringByAppendingString:@"ViewController"]];

    UIViewController * controller = [(UIViewController *)[NSClassFromString(guideClassString) alloc] initWithNibName:baseClassString bundle:nil];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
