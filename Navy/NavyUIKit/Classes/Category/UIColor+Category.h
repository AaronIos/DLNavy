//
//  UIColor+Category.h
//  NavyUIKit
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Category)

+ (UIColor *) colorRGBonvertToHSB:(UIColor*)color withBrighnessDelta:(CGFloat)delta;
+ (UIColor *) colorRGBonvertToHSB:(UIColor*)color withAlphaDelta:(CGFloat)delta;
+ (UIColor *) colorWithHexString:(NSString *)color;
+ (UIColor *) colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
+ (UIColor*) colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;
+ (UIColor*) colorWithHex:(NSInteger)hexValue;
+ (NSString *) hexFromUIColor: (UIColor*) color;

@end
