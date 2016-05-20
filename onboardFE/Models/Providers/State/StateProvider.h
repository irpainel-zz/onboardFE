//
//  State.h
//  
//
//  Created by Taqtile on 12/15/15.
//  Copyright © 2015 Taqtile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StateProvider : NSObject

@property (strong, nonatomic, readonly) NSArray* stateInitials;
@property (strong, nonatomic, readonly) NSArray* stateNames;

-(NSString *)initialFromName:(NSString *)stateName;
-(NSString *)nameFromInitial:(NSString *)stateInitial;

@end
