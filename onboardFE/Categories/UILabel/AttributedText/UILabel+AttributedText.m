//
//  UILabel+AttributedText.m
//  
//
//  Created by Taqtile on 8/17/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "UILabel+AttributedText.h"

@implementation UILabel (AttributedText)

-(void) setText:(NSString*) text attributes:(NSDictionary*) textAttributes
{
    NSMutableAttributedString* attributedText = [[NSMutableAttributedString alloc] initWithString:text];
    NSRange allRange = [text rangeOfString:text];
    [attributedText setAttributes:textAttributes range:allRange];
    self.attributedText = attributedText;
}

-(void) addText:(NSString*) text attributes:(NSDictionary*) textAttributes
{
    NSMutableAttributedString* attributedText = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    NSRange textRange = [self.text rangeOfString:text];
    [attributedText setAttributes:textAttributes range:textRange];
    self.attributedText = attributedText;
}

@end
