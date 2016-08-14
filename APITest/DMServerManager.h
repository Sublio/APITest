//
//  DMServerManager.h
//  APITest
//
//  Created by sublio on 14/08/16.
//  Copyright (c) 2016 sublio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DMServerManager : NSObject


+(DMServerManager*) sharedManager;

-(void) getFriendsWithOffset:(NSInteger) offset count:(NSInteger) count onSuccess:(void(^)(NSArray* friends)) success onFailure:(void(^)(NSError* error, NSInteger* statusCode)) failure;

@end
