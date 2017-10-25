//
//  NVViewModel.h
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NVViewModelProtocol.h"
#import "NVDataModel.h"

@interface NVViewModel : NVDataModel
<NVViewModelProtocol>
@property (nonatomic, strong) NSString* name;
@property (nonatomic, weak) id dataModel;
@property (nonatomic, copy) void(^eventBlock)(NSObject* object);
@end

