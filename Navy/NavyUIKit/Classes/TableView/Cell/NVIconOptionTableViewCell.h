//
//  NVIconOptionTableViewCell.h
//  LBYunZhi
//
//  Created by Astraea尊 on 2017/9/15.
//  Copyright © 2017年 Astraea尊. All rights reserved.
//

#import "NVIconSheetTableViewCell.h"

@protocol NVIconOptionTableViewCellDelegate;

@interface NVIconOptionTableViewCell : NVIconSheetTableViewCell

@property (nonatomic, assign) id<NVIconOptionTableViewCellDelegate> optionDelegate;

@end

@protocol NVIconOptionTableViewCellDelegate <NSObject>

- (void)iconOptionTableViewCell:(NVIconOptionTableViewCell *)cell didCloseClickWithObject:(NVIconSheetDataModel *)object;

@end
