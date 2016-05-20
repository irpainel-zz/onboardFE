//
//  TQTMissingMethodImplementationException.m
//  onboardFE
//
//  Created by Tqt iOS on 5/20/2016.
//  Copyright (c) 2016 Taqtile. All rights reserved.
//

#import "TQTMissingMethodImplementationException.h"

@implementation TQTMissingMethodImplementationException
-(instancetype) initWithSelector:(SEL)selector {
    self = [super initWithName: @"TQTMissingMethodImplementationException"
                        reason:[NSString stringWithFormat:@"You must override the method %@ in a subclass \n", NSStringFromSelector(selector)]
                      userInfo:nil];
    return self;
}
@end
