//
//  TQTTitleView.m
//  onboardFE
//
//  Created by Tqt iOS on 5/20/2016.
//  Copyright (c) 2016 Taqtile. All rights reserved.
//

#import "TQTTitleView.h"

@implementation TQTTitleView
{
    __weak IBOutlet UILabel *_titleLabel;
}

-(void)setupOnInitWithFrame{}
-(void)setupOnAwakeFromNib{}

-(void)setTitle: (NSString *)title {
    _titleLabel.text = title;
}

@end
