//
//  TQTGuideTitleView.m
//  onboardFE
//
//  Created by Tqt iOS on 5/20/2016.
//  Copyright (c) 2016 Taqtile. All rights reserved.
//

#import "TQTGuideTitleView.h"

@implementation TQTGuideTitleView
{
    __weak IBOutlet UILabel *_titleLabel;
}

-(void)setupOnInitWithFrame{}

-(void)setTitle:(NSString *)title {
    _titleLabel.text = title;
}
@end
