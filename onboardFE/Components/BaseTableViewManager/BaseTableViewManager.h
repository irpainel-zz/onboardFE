//
//  BaseTableViewManager.h
//  
//
//  Created by Taqtile on 10/9/14.
//  Copyright (c) 2014 Taqtile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol BaseTableViewManager <NSObject>

-(void) setDataToCell:(id) cell withData:(id) item;
-(NSArray*) getCellsClasses;

@optional
-(Class) getCellClassForItem:(id)item;
-(CGFloat) getTableViewContentHeight;

@end

@interface BaseTableViewManager : NSObject<UITableViewDataSource, UITableViewDelegate, BaseTableViewManager>

@property (strong, nonatomic) UITableView* tableView;
@property (strong, nonatomic) NSArray* data;
@property id<UIScrollViewDelegate> scrollViewDelegate;

-(id) initWithTableView:(UITableView*) tableView;
-(void) updateWithData:(NSArray*) data;
-(id) getItem:(NSIndexPath *)indexPath;

@end
