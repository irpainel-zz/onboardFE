//
//  CPFTextFieldView.h
//  
//
//  Created by Taqtile on 8/14/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "TQTCustomTextFieldView.h"

@interface CPFTextFieldView : TQTCustomTextFieldView

@property (readonly) int cpfLength;

- (NSString*)getFormattedCpf;

@end
