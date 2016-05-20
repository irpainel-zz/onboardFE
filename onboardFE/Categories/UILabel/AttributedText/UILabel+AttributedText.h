//
//  UILabel+AttributedText.h
//  
//
//  Created by Taqtile on 8/17/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (AttributedText)

-(void) setText:(NSString*) text attributes:(NSDictionary*) textAttributes;

-(void) addText:(NSString*) text attributes:(NSDictionary*) textAttributes;

@end
