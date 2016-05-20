//
//  NSString+Clean.h
//  
//
//  Created by Taqtile on 8/13/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Clean)

-(NSString*) stringWithOnlyNumbers;

-(NSArray*) charArray;

-(NSString*) withMask:(NSString*) mask;

-(NSString*) appendString:(NSString*)second atIndex:(NSRange) index;

-(NSString*)stringByReturningFirstWord;

@end
