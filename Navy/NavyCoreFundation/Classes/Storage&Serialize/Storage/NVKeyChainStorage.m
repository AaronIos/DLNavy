//
//  PAKeyChainStorage.m
//
//  Created by Astraea尊 on 15/11/16.
//  Copyright © 2015年 Astraea尊. All rights reserved.
//

#import "NVKeyChainStorage.h"
#import "NVUtility.h"
#import "NSObject+Category.h"
#import "Navy.h"
#import "InfKeychain.h"


NSString * const PAKeyChainStorageServiceKey = @"_keyChainStorageService_";

@implementation NVKeyChainStorage

- (id) readObjectForKey:(NSString*)key {
    NSString* serviceName  = [self keyChainServiceName];
    NSError* error         = nil;
    
    NSString* keyChainValue = [InfKeychain passwordForUsername:key serviceName:serviceName error:&error];
    
    if (error) {
        NSLog(@"%s : store in keychain for key:%@ error:%@", __PRETTY_FUNCTION__, key, [error localizedDescription]);
        return nil;
    }
    
    return [self unachieveStringToObject:keyChainValue];
}

- (void) writeObject:(id)object forKey:(NSString *)key {
    BOOL success            = YES;
    NSError* error          = nil;
    NSString* serviceName   = [self keyChainServiceName];
    
    NSString* toStore = nil;
    if ([object isKindOfClass:[NSString class]]) {
        toStore = object;
    } else if ([object isKindOfClass:[NSDictionary class]] || [object isKindOfClass:[NSArray class]]) {
        toStore = [self achieveObjectToString:object];
        if (toStore == nil) {
            return;
        }
    } else {
        NSLog(@"%s : not supported class to store %@",__PRETTY_FUNCTION__, [object class]);
        return;
    }
    
    success = [InfKeychain storeUsername:key andPassword:toStore forServiceName:serviceName updateExisting:YES error:&error];
    
    if (!success) {
        NSLog(@"%s : store in keychain for key:%@ error:%@", __PRETTY_FUNCTION__, key, [error localizedDescription]);
    }
}

#pragma mark - achieve object

- (NSString *)achieveObjectToString:(id)object {
    if (!isClass(object, NSDictionary) && !isClass(object, NSArray)) {
        NSAssert(NO, @"achieve object must be dictionary or array");
    }
    NSString *errorString = nil;
    NSData *propertyRep = [NSPropertyListSerialization dataFromPropertyList:object format:NSPropertyListXMLFormat_v1_0 errorDescription:&errorString];
    
    if (errorString) {
//        NSLog(@"%s : get object property list error :%@", __PRETTY_FUNCTION__, errorString);
        return nil;
    }
    
    NSString *achieveString = [[NSString alloc] initWithBytes:[propertyRep bytes] length:[propertyRep length] encoding:NSUTF8StringEncoding];
    return achieveString;
}

- (id)unachieveStringToObject:(NSString *)string {
    NSError *error;
    id obj = nil;
    if (string && string.length) {
        NSData *propertyRep = [string dataUsingEncoding:NSUTF8StringEncoding];
        obj = [NSPropertyListSerialization propertyListWithData:propertyRep options:NSPropertyListImmutable format:nil error:&error];
        if (error) {
//            NSLog(@"%s : unachive property error%@", __PRETTY_FUNCTION__, error);
            return obj;
        }
    }
    return obj;
}

#pragma mark - key chain service name
- (NSString *) keyChainServiceName {
    NSString * serviceName = nil;
    NSString * urlScheme   = [NVUtility appUrlScheme];
    
    serviceName            = [NSString stringWithFormat:@"%@%@", urlScheme, PAKeyChainStorageServiceKey];
    
    NSLog(@"%@", serviceName);
    return serviceName;
}

@end
