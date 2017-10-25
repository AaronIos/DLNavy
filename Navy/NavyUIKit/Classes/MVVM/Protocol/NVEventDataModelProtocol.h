//
//  NVEventDataModelProtocol.h
//  LBYunZhi
//
//  Created by Astraea尊 on 2017/9/19.
//  Copyright © 2017年 Astraea尊. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NVEventDataModelProtocol <NSObject>

@optional
@property (nonatomic, copy) void(^eventBlock)(NSObject* object, NSString* eventName);

@end
