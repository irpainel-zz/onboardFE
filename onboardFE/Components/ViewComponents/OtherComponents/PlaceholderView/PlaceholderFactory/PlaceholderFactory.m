//
//  PlaceholderFactory.m
//  
//
//  Created by Taqtile on 9/18/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "PlaceholderFactory.h"
#import "Message.h"

@implementation PlaceholderFactory

#pragma mark - Singleton Methods
+ (id)sharedInstance {
    static PlaceholderFactory *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    if (self = [super init]) {
    }
    return self;
}

#pragma mark - Placeholder factories
-(PlaceholderView *)workInProgressPlaceholder {
    return [[PlaceholderView alloc] initWithFrame:CGRectZero
                                            image:[UIImage imageNamed:@"img-wip"]
                                      buttonTitle:nil
                                          message:[Message messageWithKey:@"placeholder.work_in_progress"]
                                         delegate:nil];
}

-(PlaceholderView *)noConnectionPlaceholderWithDelegate:(id)delegate {
    return [[PlaceholderView alloc] initWithFrame:CGRectZero
                                            image:[UIImage imageNamed:@"img-wifi"]
                                      buttonTitle:[Message messageWithKey:@"placeholder.try_again"]
                                          message:[Message messageWithKey:@"placeholder.no_connection"]
                                         delegate:delegate];
}

-(PlaceholderView *)noProductFoundPlaceholder {
    return [[PlaceholderView alloc] initWithFrame:CGRectZero
                                            image:[UIImage imageNamed:@"img-binocular"]
                                      buttonTitle:nil
                                          message:[Message messageWithKey:@"placeholder.no_product_found"]
                                         delegate:nil];
}

@end