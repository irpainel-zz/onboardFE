//
//  TQTMissingMethodImplementationException.h
//  onboardFE
//
//  Created by Tqt iOS on 5/20/2016.
//  Copyright (c) 2016 Taqtile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TQTMissingMethodImplementationException : NSException
-(instancetype) initWithSelector:(SEL)selector;
@end
