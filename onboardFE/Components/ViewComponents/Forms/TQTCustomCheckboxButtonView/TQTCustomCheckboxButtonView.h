//
//  TQTCustomCheckboxButtonView.h
//  onboardFE
//
//  Created by Tqt iOS on 5/20/2016.
//  Copyright (c) 2016 Taqtile. All rights reserved.
//

#import "TQTBaseComponentsView.h"

typedef enum : NSUInteger {
    TQTCustomCheckboxButtonViewStateActive,
    TQTCustomCheckboxButtonViewStateInactive,
} TQTCustomCheckboxButtonViewState;

/**
 * Implementation of a checkbox using UIButton
 */
@interface TQTCustomCheckboxButtonView : TQTBaseComponentsView
@property (nonatomic) BOOL selected;
@property (nonatomic) TQTCustomCheckboxButtonViewState state;
@end
