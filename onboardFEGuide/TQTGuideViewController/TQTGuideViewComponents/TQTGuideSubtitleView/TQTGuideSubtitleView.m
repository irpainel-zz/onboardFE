//
//  TQTGuideSubtitleView.m
//  onboardFE
//
//  Created by Tqt iOS on 5/20/2016.
//  Copyright (c) 2016 Taqtile. All rights reserved.
//

#import "TQTGuideSubtitleView.h"

@implementation TQTGuideSubtitleView
{
    __weak IBOutlet UILabel *_subtitleLabel;
}

-(void)setupOnInitWithFrame{}

-(void)setSubtitle:(NSString *)title {
    _subtitleLabel.text = title;
}

@end
