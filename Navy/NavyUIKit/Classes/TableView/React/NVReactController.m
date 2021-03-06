//
//  NVReactController.m
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import "NVReactController.h"

@implementation NVReactController

- (void) dealloc {
    [self clear];
}

- (NSMutableArray*) reactItems {
    if (_reactItems == nil) {
        _reactItems = [[NSMutableArray alloc] init];
    }
    return _reactItems;
}


- (NVReactor*) reactor {
    if (_reactor == nil) {
        _reactor = [[NVReactor alloc] init];
    }
    
    return _reactor;
}

- (void) reactType:(NSString *)type dataModel:(NVDataModel *)dataModel {
    
}


- (void) reactCellType:(NSString *)cellType dataModel:(NVDataModel *)dataModel {
    
}

- (void) clear {
    [self.reactor unregisterAllObservedObjects];
}


@end
