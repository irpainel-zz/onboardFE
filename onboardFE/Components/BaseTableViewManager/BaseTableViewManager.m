//
//  BaseTableViewManager.m
//  
//
//  Created by Taqtile on 10/9/14.
//  Copyright (c) 2014 Taqtile. All rights reserved.
//

#import "BaseTableViewManager.h"
#import "TQTMissingMethodImplementationException.h"
#import "Colors.h"

@interface BaseTableViewManager()

@property (strong, nonatomic) NSMutableDictionary *registeredNibsIdentifiers;

@end

@implementation BaseTableViewManager

#pragma mark - public methods
-(id) initWithTableView:(UITableView *)tableView
{
    self = [super init];
    
    if(self){
        self.tableView = tableView;
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, CGFLOAT_MIN)];
        self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, CGFLOAT_MIN)];
        [self.tableView setBackgroundColor:UICOLOR_FROM_HEX(COLOR_GRAY_LIGHTEST)];
        [self setup];
    }
    
    return self;
}

-(id) getItem:(NSIndexPath *)indexPath{
    return [self.data objectAtIndex:indexPath.row];
}


-(void) updateWithData:(NSArray *)data
{
    //self.data = data;
    [self registerCellNibs];
    [self.tableView reloadData];
}

#pragma mark - abstract methods
-(void) setup
{
    self.registeredNibsIdentifiers = [NSMutableDictionary new];
}

-(void)setDataToCell:(id)cell withData:(id)item
{
    @throw [[TQTMissingMethodImplementationException alloc] initWithSelector:_cmd];
}

-(NSArray *)getCellsClasses
{
    @throw [[TQTMissingMethodImplementationException alloc] initWithSelector:_cmd];
}

#pragma mark - optional methods to be overriden
-(Class)getCellClassForItem:(id)item
{
    return [[self getCellsClasses] firstObject];;
}

-(CGFloat)getTableViewContentHeight
{
    [self.tableView layoutIfNeeded];
    return [self.tableView contentSize].height;
}

#pragma mark - Register Nibs
-(void)registerCellNibs{
    NSArray* cellClasse = [self getCellsClasses];
    for (Class class in cellClasse) {
        
        NSString *cellClassName = NSStringFromClass(class);
        NSString *cellIdentifier = [self cellIdentifierForClass:cellClassName];
        
        if([self isNibRegisteredForClassName:cellClassName] == NO){
            [self.registeredNibsIdentifiers setObject:cellIdentifier forKey:cellClassName];
            [self.tableView registerNib:[UINib nibWithNibName:cellClassName bundle:nil]
                 forCellReuseIdentifier:cellIdentifier];
        }
    }
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.data count];
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id item = [self getItem:indexPath];
    
    id cell = [tableView dequeueReusableCellWithIdentifier:[self cellIdentifierForClass:[[self getCellClassForItem:item] description]]];
    [self setDataToCell:cell withData:item];
    
    return cell;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{    
    // Prevent the cell from inheriting the Table View's margin settings
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    
    // Explictly set your cell's layout margins
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if(self.scrollViewDelegate){
        [self.scrollViewDelegate scrollViewDidScroll:scrollView];
    }
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self.scrollViewDelegate scrollViewDidEndDragging:scrollView willDecelerate:decelerate];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self.scrollViewDelegate scrollViewDidEndDecelerating:scrollView];
}

#pragma mark - other
-(BOOL)isNibRegisteredForClassName:(NSString *)className
{
    return [self.registeredNibsIdentifiers.allKeys containsObject:className];
}

-(NSString*) cellIdentifierForClass:(NSString*) cellClassName
{
    return [NSString stringWithFormat:@"IDENTIFIER_%@",cellClassName];
}

@end