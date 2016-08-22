//
//  ViewController.m
//  APITest
//
//  Created by sublio on 14/08/16.
//  Copyright (c) 2016 sublio. All rights reserved.
//

#import "ViewController.h"
#import "DMServerManager.h"

@interface ViewController ()

@property (strong,nonatomic) NSMutableArray* friendsArray;

@end

@implementation ViewController


static NSInteger friendsRequest = 5;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.friendsArray = [NSMutableArray alloc];
    [self getFriendsFromServer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma  mark - API


- (void) getFriendsFromServer {
    
    [[DMServerManager sharedManager] getFriendsWithOffset:[self.friendsArray count] count:friendsRequest onSuccess:^(NSArray *friends) {
        
        
        [self.friendsArray addObjectsFromArray:friends];
        //[self.tableView reloadData];
        
        
        NSMutableArray* newPaths = [NSMutableArray array];
        
        for (int i= (int)[self.friendsArray count] - (int)[friends count]; i< [self.friendsArray count]; i++){
        
            
            [newPaths addObject:[NSIndexPath indexPathForRow:i inSection:0]];
            
            
            
        }
        
        
        [self.tableView beginUpdates];
        [self.tableView insertRowsAtIndexPaths:newPaths withRowAnimation:UITableViewRowAnimationTop];
        [self.tableView endUpdates];
        
        
    } onFailure:^(NSError *error, NSInteger *statusCode) {
        NSLog(@"error = %@, code = %d", [error localizedDescription], statusCode);
    }];
    
}


#pragma  mark - UITableViewDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.friendsArray count];
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString* identifier = @"Cell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell){
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier] ;
    }
    
    return cell;
}



@end
