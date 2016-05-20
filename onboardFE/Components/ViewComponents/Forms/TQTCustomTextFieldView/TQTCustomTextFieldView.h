//
//  TQTCustomTextFieldView.h
//  
//
//  Created by Tqt iOS on 11/25/2015.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "TQTBaseComponentsView.h"

typedef enum : NSUInteger {
    TQTCustomTextFieldViewStateDefault,
    TQTCustomTextFieldViewStateActive,
    TQTCustomTextFieldViewStateInactive,
    TQTCustomTextFieldViewStateError,
    TQTCustomTextFieldViewStateHighlight,
} TQTCustomTextFieldViewState;

@class TQTCustomTextFieldView;

@protocol TQTCustomTextFieldViewDelegate <NSObject>

@optional
- (BOOL)customTextFieldViewShouldReturn:(TQTCustomTextFieldView*)textField;
- (void)customTextFieldViewDidBeginEditing:(TQTCustomTextFieldView *)textfield;
- (void)customTextFieldViewDidChange:(TQTCustomTextFieldView *)textfield;
- (void)customTextFieldViewDidEndEditing:(TQTCustomTextFieldView *)textfield;

@end

@interface TQTCustomTextFieldView : TQTBaseComponentsView

@end

/**
 * Implementation of a textfield
 * New kinds of textfield should inherit from this class.
 * This is useful to set new label, placeholder, error messages or
 * other behaviour
 */
@interface TQTCustomTextFieldView() <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *fieldNameLabel;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *textFieldButton;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;
@property (weak, nonatomic) IBOutlet UIView *textFieldContainerView;

@property (weak, nonatomic) id<TQTCustomTextFieldViewDelegate> delegate;
@property (nonatomic) BOOL required;
@property (nonatomic, strong) NSString *mask;
@property (nonatomic) TQTCustomTextFieldViewState state;

-(void)setLabelString: (NSString *)string;
-(void)setPlaceholderWithString: (NSString *)string;
-(void)setText:(NSString *)text;
-(void)setText:(NSString *)text silent:(BOOL)silent;
-(void)setCaptionText: (NSString *) string;
-(void)setKeyboardType:(UIKeyboardType)type andSecureTextEntry:(BOOL)isSecure;
-(void)setInputView:(UIView *)view;
-(void)setReturnKeyType:(UIReturnKeyType)returnKeyType;
-(void)setPlaceholderInfoIfRequired;
-(void)setAutocapitalizationType:(UITextAutocapitalizationType)autocapitalizationType;

-(BOOL)isInputValid; // This method does just "required" validation. For more validations, override it
-(NSString*)getText;

-(void)clearTextfield;
-(void)validate;

@end
