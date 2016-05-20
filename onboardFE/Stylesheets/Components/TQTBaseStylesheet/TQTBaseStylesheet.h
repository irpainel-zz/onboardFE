//
//  TQTBaseStylesheet.h
//  onboardFE
//
//  Created by Tqt iOS on 5/20/2016.
//  Copyright (c) 2016 Taqtile. All rights reserved.
//

#import <Foundation/Foundation.h>

// This is the file for the base rules, i.e. rules for UI classes (UITextfield, UILabel etc)
// To add styles to your class, add to the dictionary in the `stylesheet` method:
// - your class name as the key of the dictionary
// a dictionary containing the properties and theirs values as the value of the dictionary.
// ex:
//    return @{ // Add your style rules to this dictionary
//             @"YourClassName": @{
//                     @"propertyNameOfYourClass": VALUE_OF_PROPERTY
//                     @"font": LABEL_TYPE_VALUE_FONT,
//                     },
//             };
@interface TQTBaseStylesheet : NSObject
+ (NSDictionary *)stylesheet;
@end
