//
//  NVJavaScriptDataModelProtocol.h
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol NVJavaScriptDataModelProtocol <NSObject>
- (id) initWithArgs:(NSArray*)array;
- (NSArray*) argsValue;
- (BOOL) available:(NSArray*)argsValue;
@end
