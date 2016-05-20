//
//  TQTGuideViewController.m
//  onboardFE
//
//  Created by Tqt iOS on 5/20/2016.
//  Copyright (c) 2016 Taqtile. All rights reserved.
//

#import "TQTGuideViewController.h"
#import "TQTGuideTableViewDataModel.h"
#import "TQTTypographyViewController.h"
#import "TQTColorSwatchesViewController.h"
#import "TQTControlsViewController.h"
#import "TQTFormsViewController.h"
#import "TQTListsViewController.h"
#import "TQTComponentsViewController.h"
#import "TQTOtherComponentsViewController.h"
#import "TQTViewControllersViewController.h"
#import "TQTProvidersViewController.h"

#define CELL_IDENTIFIER @"defaultCellIdentifier"

@interface TQTGuideViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) NSArray *tableViewData;
@end

@implementation TQTGuideViewController
{
    __weak IBOutlet UITableView *_tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

#pragma mark - setup
- (void)setup {
    [self setTitle:@"Styleguide"];
    self.navigationController.navigationBar.translucent = NO;

    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CELL_IDENTIFIER];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self removeExtraSeparatorsFromTableView:_tableView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tableViewData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:CELL_IDENTIFIER];

    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = ((TQTGuideTableViewDataModel *)self.tableViewData[indexPath.row]).text;

    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *vc = [[((TQTGuideTableViewDataModel *)self.tableViewData[indexPath.row]).nextViewController alloc] initWithNibName:NSStringFromClass([TQTComponentsViewController class]) bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Private methods
- (void)removeExtraSeparatorsFromTableView:(UITableView *)tableView {
    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

#pragma mark - getter
-(NSArray *)tableViewData {
    if (!_tableViewData) {

        _tableViewData = @[
                            [[TQTGuideTableViewDataModel alloc] initWithText:@"Providers" class:[TQTProvidersViewController class]],
                            [[TQTGuideTableViewDataModel alloc] initWithText:@"Typography" class:[TQTTypographyViewController class]],
                            [[TQTGuideTableViewDataModel alloc] initWithText:@"Colors" class:[TQTColorSwatchesViewController class]],
                            [[TQTGuideTableViewDataModel alloc] initWithText:@"Controls" class:[TQTControlsViewController class]],
                            [[TQTGuideTableViewDataModel alloc] initWithText:@"Forms" class:[TQTFormsViewController class]],
                            [[TQTGuideTableViewDataModel alloc] initWithText:@"Lists" class:[TQTListsViewController class]],
                            [[TQTGuideTableViewDataModel alloc] initWithText:@"Other components" class:[TQTOtherComponentsViewController class]],
                            [[TQTGuideTableViewDataModel alloc] initWithText:@"View controllers" class:[TQTViewControllersViewController class]],
                            ];
    }
    return _tableViewData;
}
@end
