//
//  PlaceholderFactory.h
//  
//
//  Created by Taqtile on 9/18/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlaceholderView.h"

@interface PlaceholderFactory : NSObject

- (id)init NS_UNAVAILABLE;
+ (id)sharedInstance;

-(PlaceholderView *)workInProgressPlaceholder;
-(PlaceholderView *)noConnectionPlaceholderWithDelegate:(id)delegate;
-(PlaceholderView *)noProductFoundPlaceholder;

@end