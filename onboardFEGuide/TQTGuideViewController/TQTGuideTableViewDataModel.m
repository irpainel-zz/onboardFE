//
//  TQTGuideTableViewDataModel.m
//  onboardFE
//
//  Created by Tqt iOS on 5/20/2016.
//  Copyright (c) 2016 Taqtile. All rights reserved.
//

#import "TQTGuideTableViewDataModel.h"

@interface TQTGuideTableViewDataModel()

@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) Class nextViewController;

@end

@implementation TQTGuideTableViewDataModel
-(instancetype)initWithText:(NSString *)text class:(Class)class {
    self = [super init];
    if (self) {
        self.text = text;
        self.nextViewController = class;
    }
    return self;
}
@end
