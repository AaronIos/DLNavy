//
//  NVViewModelCommand.m
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import "NVViewModelCommand.h"

@implementation NVViewModelCommand

- (instancetype) initWithConsumeHandler:(NVViewModelCommandConsumeBlock)consumeHandler {
    
    self = [super init];
    if (self) {
        
        
    }
    return self;
}


- (instancetype) initWithConsumeHandler:(NVViewModelCommandConsumeBlock)consumeHandler cancelHandler:(NVViewModelCommandCancelBlock)cancelHandler {
    
    self = [super init];
    if (self) {
        
       
    }
    return self;
}


@end
