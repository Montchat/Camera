//
//  SelfieTableViewConroller.m
//  Camera
//
//  Created by Joe E. on 10/19/15.
//  Copyright © 2015 Joe E. All rights reserved.
//

#import "SelfieTableViewController.h"
#import "SelfieTableViewCell.h"
#import <Parse/Parse.h>

@interface SelfieTableViewController ()

@end

@implementation SelfieTableViewController

{
    NSMutableArray *selfies;
}

- (void) logout {
    
    [PFUser logOut];
    
    UIStoryboard * userStoryboard = [UIStoryboard storyboardWithName:@"User" bundle:nil];
    UINavigationController *nc = [userStoryboard instantiateInitialViewController];
    
    [UIApplication sharedApplication].windows[0].rootViewController = nc;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
    
    UIBarButtonItem * logoutButton = [[UIBarButtonItem alloc] initWithTitle:@"logout" style:UIBarButtonItemStylePlain target:self action:@selector(logout)];
    
//    self.navigationController.navigationItem.rightBarButtonItem = logoutButton;
    self.navigationItem.leftBarButtonItem  = logoutButton;
    
    NSLog(@"%@", self.navigationController.navigationItem);
    NSLog(@"%@", self.navigationItem);
    
    selfies = [@[] mutableCopy];
    
    PFQuery * selfieQuery = [PFQuery queryWithClassName:@"Selfie"];
    [selfieQuery findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        
        for (PFObject * selfie in objects) {
            
            NSLog(@"%@", selfie);
            [selfies addObject:selfie];
        }
        NSLog(@"queryDidFinish");
        [self.tableView reloadData];
        
    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%@", selfies);
    NSLog(@"current selfies count: %d", selfies.count);
    return selfies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SelfieTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"SelfieCell" forIndexPath:indexPath];
    cell.selfie = selfies[indexPath.row];
    return cell;
    
}

@end
