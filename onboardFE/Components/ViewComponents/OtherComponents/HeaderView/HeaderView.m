//
//  HeaderView.m
//  onboardFE
//
//  Created by Taqtile on 5/20/16.
//  Copyright © 2016 Taqtile. All rights reserved.
//

#import "HeaderView.h"

@interface HeaderView ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
@implementation HeaderView

-(void)setupOnInitWithCoder {
    
}

-(void)setupOnInitWithFrame {
    
}

-(void)setTitle:(NSString *)title {
    [self.titleLabel setText:title];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
