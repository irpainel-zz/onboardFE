//
//  CategoryListTableViewCell.m
//  
//
//  Created by Taqtile on 12/3/15.
//  Copyright © 2015 Taqtile. All rights reserved.
//

#import "CustomTableViewCell.h"
#import "Colors.h"
#import "Components.h"
#import "UIView+Constraints.h"

@implementation CustomTableViewCell {
    __weak IBOutlet UILabel *_descriptionLabel;
    __weak IBOutlet UIImageView *_disclosureImageView;
}

- (void)awakeFromNib {
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
        [self.contentView setBackgroundColor:highlighted ? UICOLOR_FROM_HEXA(COLOR_GRAY, HIGHLIGHT_ALPHA) : [UIColor clearColor]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
}

#pragma mark - public methods

-(void)setDescription:(NSString *)description {
    _descriptionLabel.text = description;
}

-(void)hideDisclosure {
    [_disclosureImageView setHidden:YES];
    _disclosureImageView.leftConstraint.constant = 0;
    _disclosureImageView.widthConstraint.constant = 0;

}
@end
