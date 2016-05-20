//
//  TQTProvidersViewController.m
//  tete
//
//  Created by Taqtile on 12/24/15.
//  Copyright © 2015 Taqtile. All rights reserved.
//

#import "TQTProvidersViewController.h"
#import "Components.h"
#import "TQTStylesheets.h"
#import "LoadingView.h"

@interface TQTProvidersViewController ()

@property(strong, nonatomic) LoadingView *loadingView;

@end

@implementation TQTProvidersViewController
{
    UITextView *_textView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Overriden methods
-(void)addComponents {
    _textView = (UITextView *)[self addViewWithClass:UITextView.class height:100];

    [self addButtonWithTitle:@"Get request example" selector:@selector(requestExample)];
}

#pragma mark - Requests
- (void)requestExample {
    [self startRequest];
    [self finishRequestWithResponse:@"RESPONSE: Lorem ipsum dolor sit amet, in has clita menandri. An inani epicurei duo, ea usu dicat principes adversarium, eum ne putant corpora liberavisse. Et est dico facer deterruisset, usu tale ignota invenire an. At vim facer malorum eripuit, at vel amet iuvaret."];
}

#pragma mark - private
-(void)startRequest {
    [self.loadingView showLoadingOverView:_textView withCompletion:nil];
}

-(void)finishRequestWithResponse:(NSString *)response {
    [self.loadingView hideLoadingWithDelay:NO];
    [_textView setText:response];
}

-(void)addButtonWithTitle:(NSString *)title selector:(SEL)selector {
    UIButton *button= (UIButton *)[self addViewWithDefaultMarginsAndClass:[UIButton class] height:BUTTON_HEIGHT];
    [[TQTStylesheets sharedInstance] setStyle:@"Primary_Button" forView:button];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
}

#pragma - getter
-(LoadingView *) loadingView {
    if(!_loadingView) {
        _loadingView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([LoadingView class]) owner:self options:nil] objectAtIndex:0];
    }
    return _loadingView;
}

@end
