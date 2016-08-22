//
//  DMServerManager.m
//  APITest
//
//  Created by sublio on 14/08/16.
//  Copyright (c) 2016 sublio. All rights reserved.
//

#import "DMServerManager.h"
#import "AFNetworking.h"


@interface DMServerManager ()

@property (strong, nonatomic) AFHTTPRequestOperationManager* requestOperationManager;

@end

@implementation DMServerManager



+(DMServerManager*) sharedManager{
    
    static DMServerManager* manager = nil;
    
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[DMServerManager alloc]init];
    });
    
    return manager;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSURL* url = [NSURL URLWithString:@"https://api.vk.com/method/"];
        self.requestOperationManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:url];
    }
    return self;
}



-(void) getFriendsWithOffset:(NSInteger) offset count:(NSInteger) count onSuccess:(void(^)(NSArray* friends)) success onFailure:(void(^)(NSError* error, NSInteger* statusCode)) failure{
    
    
    
    NSDictionary* params = [NSDictionary dictionaryWithObjectsAndKeys:@"26955116",@"", nil];
    
    [self.requestOperationManager
     GET:@"https://api.vk.com/method/friends.get" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject){
        
        
        
        
        NSLog(@"JSON: %@",responseObject);
        
        
        
    }failure:^(AFHTTPRequestOperation *operation, NSError *error){
        
        
        NSLog(@"Error:%@",error);
        
    }
     
     ];
    
}

@end
