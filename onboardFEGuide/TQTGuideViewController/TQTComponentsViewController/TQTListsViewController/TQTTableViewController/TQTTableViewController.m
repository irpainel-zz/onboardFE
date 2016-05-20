//
//  TQTTableViewController.m
//  
//
//  Created by Taqtile on 9/3/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "Colors.h"
#import "CustomTableViewCell.h"
#import "TQTTableViewController.h"


@interface TQTTableViewController ()

@end

@implementation TQTTableViewController

/**
 * Add a new class to _title to add a new cell to this view
 **/

- (NSArray *)tableViewCellClasses
{
    static NSArray *_titles;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _titles = @[
                    NSStringFromClass([CustomTableViewCell class]),
                    ];
    });
    return _titles;
}

#pragma mark - ViewController default methods (it is not necessary to change these methods)
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setAllowsSelection:YES];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 300;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    for (NSString *className in [self tableViewCellClasses]) {
        [self.tableView registerNib:[UINib nibWithNibName:className bundle:nil] forCellReuseIdentifier:className];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self tableViewCellClasses] count] * 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    NSString *className = [[self tableViewCellClasses] objectAtIndex:indexPath.row / 2];

    if (indexPath.row % 2) {
        cell = [tableView dequeueReusableCellWithIdentifier:className forIndexPath:indexPath];
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
        cell.textLabel.text = className;
        cell.backgroundColor = UICOLOR_FROM_HEX(COLOR_PRIMARY);
    }

    [cell updateConstraintsIfNeeded];
    return cell;
}

@end
