//
//  TQTCustomRadioButtonView.h
//  onboardFE
//
//  Created by Tqt iOS on 5/20/2016.
//  Copyright (c) 2016 Taqtile. All rights reserved.
//

#import "TQTBaseComponentsView.h"

typedef enum : NSUInteger {
    TQTCustomRadioButtonViewStateActive,
    TQTCustomRadioButtonViewStateInactive,
} TQTCustomRadioButtonViewState;

/**
 * Implementation of a radio button using UIButton
 */
@interface TQTCustomRadioButtonView : TQTBaseComponentsView
@property (nonatomic) BOOL selected;
@property (nonatomic) TQTCustomRadioButtonViewState state;
@end
