//
//  DMServerManager.m
//  APITest
//
//  Created by sublio on 14/08/16.
//  Copyright (c) 2016 sublio. All rights reserved.
//

#import "DMServerManager.h"

@implementation DMServerManager



+(DMServerManager*) sharedManager{
    
    static DMServerManager* manager = nil;
    
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[DMServerManager alloc]init];
    });
    
    return manager;
}

@end
