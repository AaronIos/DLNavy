//
//  NVIconOptionTableViewCell.m
//  LBYunZhi
//
//  Created by Astraea尊 on 2017/9/15.
//  Copyright © 2017年 Astraea尊. All rights reserved.
//

#import "NVIconOptionTableViewCell.h"



@interface NVIconOptionTableViewCell ()

@property (nonatomic, strong) UIImageView* uiIconView;
@property (nonatomic, strong) UIImageView* uiHintImage;
@property (nonatomic, strong) UIView*      optionView;
@property (nonatomic, strong) UILabel*     optionLabel;

@end


#define CELL_HEIGHT     50.f


@implementation NVIconOptionTableViewCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor        = COLOR_DEFAULT_WHITE;
        
        self.selectionStyle         = UITableViewCellSelectionStyleNone;
        
        self.uiIconView             = [[UIImageView alloc] initWithFrame:CGRectMake(15.0f,
                                                                                    (CELL_HEIGHT - 22.0f)/2,
                                                                                    22.0f,
                                                                                    22.0f)];
        [self.contentView addSubview:self.uiIconView];
        self.uiIconView.contentMode = UIViewContentModeScaleAspectFit;
        self.uiIconView.image       = [UIImage imageNamed:@"icon_info_manage.png"];
        
        
        CGRect frame                = _uiTitle.frame;
        frame.origin.x              = 39.0f + 10.0f;
        _uiTitle.frame              = frame;
        
        
        self.uiHintImage            = [[UIImageView alloc] initWithFrame:CGRectMake(100.f,
                                                                                    (CELL_HEIGHT - 20.0f)/2,
                                                                                    20.f,
                                                                                    20.f)];
        self.uiHintImage.hidden     = YES;
        [self.contentView addSubview:self.uiHintImage];
        
        
        self.optionView                 = [[UIView alloc] initWithFrame:CGRectMake(0, CELL_HEIGHT, APPLICATIONWIDTH, 40)];
        [self.contentView addSubview:self.optionView];
        self.optionView.hidden          = YES;
        
        self.optionLabel                = [[UILabel alloc] initWithFrame:CGRectMake(_uiTitle.frame.origin.x,
                                                                                   (self.optionView.frame.size.height - 20) / 2.f,
                                                                                   APPLICATIONWIDTH,
                                                                                    20.f)];
        [self.optionView addSubview:self.optionLabel];
        
        UIButton* closeBtn              = [[UIButton alloc] initWithFrame:CGRectMake(APPLICATIONWIDTH - 30.f,
                                                                                    self.optionLabel.frame.origin.y,
                                                                                     20, 20)];
        [closeBtn setImage:[UIImage imageNamed:@"icon_cancelcoupons"] forState:UIControlStateNormal];
        [closeBtn addTarget:self action:@selector(closeClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.optionView addSubview:closeBtn];
    }
    
    return self;
}

- (void) closeClick:(UIButton *)btn {
    
    NVIconSheetDataModel* dataModel     = (NVIconSheetDataModel*)self.item;
    dataModel.isOption                  = NO;
    if (dataModel.eventBlock) {
        dataModel.eventBlock(dataModel, @"close");
    }
    if (self.optionDelegate && [self.optionDelegate respondsToSelector:@selector(iconOptionTableViewCell:didCloseClickWithObject:)]) {
        [self.optionDelegate iconOptionTableViewCell:self didCloseClickWithObject:dataModel];
    }
}

- (void) setObject:(id)object {
    [super setObject:object];
    
    NVIconSheetDataModel* dataModel     = (NVIconSheetDataModel*)self.item;
    self.optionDelegate                 = dataModel.delegate;
    self.lineUpper.hidden               = YES;
    self.lineLower.hidden               = YES;
    dataModel.cellInstance              = self;
    
    if (dataModel.isBottom) {
        self.liner.hidden               = YES;
    }
    
    self.uiIconView.image               = [UIImage imageNamed:dataModel.imageNamed];
    
    if (dataModel.accountIcon == YES) {
        
        self.uiIconView.frame       = CGRectMake(13.0f,
                                                 (CELL_HEIGHT - 22.0f)/2,
                                                 26,
                                                 22);
        CGRect frame                = _uiTitle.frame;
        frame.origin.x              = 40.0f + 10.0f;
        _uiTitle.frame              = frame;
    }
    
    if (dataModel.showHint == YES) {
        self.uiHintImage.hidden     = NO;
        self.uiHintImage.image      = [UIImage imageNamed:dataModel.hintImageName];
        if ([dataModel.position isEqualToString:@"right"]) {
            CGSize size             = [self.uiValue.text boundingRectWithSize:CGSizeMake(100000, 100000)
                                                                      options: NSStringDrawingUsesLineFragmentOrigin
                                                                   attributes:ATTR_DICTIONARY(COLOR_DEFAULT_BLACK, 12.f + fontScale) context:nil].size;
            
            self.uiHintImage.frame  = CGRectMake(APPLICATIONWIDTH - size.width - 55.f,
                                                 (CELL_HEIGHT - 20.0f)/2,
                                                 20.f,
                                                 20.f);
        } else if ([dataModel.position isEqualToString:@"left"]) {
            self.uiHintImage.frame  = CGRectMake(70.f + 30 * displayScale,
                                                 (CELL_HEIGHT - 18.0f)/2,
                                                 35.f,
                                                 18.f);
        }
    } else {
        self.uiHintImage.hidden     = YES;
    }
    
    if (dataModel.isOption) {
        self.optionView.hidden      = NO;
        self.optionLabel.attributedText = dataModel.attributedString;
        self.optionView.backgroundColor = dataModel.optionBackgroundColor;
    } else {
        self.optionView.hidden      = YES;
    }
}


+ (CGFloat) heightForCell {
    return CELL_HEIGHT;
}

+ (CGFloat) tableView:(UITableView *)tableView rowHeightForObject:(id)object {
    
    NVIconSheetDataModel* dataModel     = (NVIconSheetDataModel*)object;
    return (dataModel.isOption == NO) ? CELL_HEIGHT : CELL_HEIGHT + 40;

}


@end
