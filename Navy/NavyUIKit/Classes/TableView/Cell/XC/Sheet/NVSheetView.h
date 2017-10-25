//
//  NVSheetView.h
//  NavyUIKit
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NVSheetView : UIView
@property (nonatomic, strong) id title;
@property (nonatomic, strong) id value;
@property (nonatomic, assign) NSTextAlignment valueAlignment;
@property (nonatomic, strong) UIColor* valueColor;
@end
