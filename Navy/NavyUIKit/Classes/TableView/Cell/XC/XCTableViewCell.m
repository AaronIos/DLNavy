//
//  XCTableViewCell.m
//  NavyUIKit
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import "XCTableViewCell.h"


@interface XCTableViewCell ()
@property (nonatomic, strong) CALayer* layerBg;
@end


@implementation XCTableViewCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self    = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor                = [UIColor clearColor];
        self.selectionStyle                 = UITableViewCellSelectionStyleNone;
        
        self.layerBg                        = [CALayer layer];
        [self.contentView.layer insertSublayer:self.layerBg atIndex:0];
        self.layerBg.backgroundColor        = COLOR_DEFAULT_WHITE.CGColor;
        self.layerBg.masksToBounds          = YES;
        self.layerBg.cornerRadius           = 4.0f;
        
        
    }
    
    return self;
}

- (void) layoutSubviews {
    [super layoutSubviews];
    
    CGRect frame            = self.frame;
    frame.origin.x          = 10.0f * displayScale;
    frame.origin.y          = 0.0f;
    frame.size.width        = frame.size.width - 20.0f * displayScale;
    
    self.layerBg.frame      = frame;
}

@end
