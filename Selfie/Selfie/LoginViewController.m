//
//  LoginViewController.m
//  Camera
//
//  Created by Joe E. on 10/19/15.
//  Copyright © 2015 Joe E. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>
#import "SelfieTableViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
- (IBAction)loginButtonPressed:(id)sender {
    
    NSString * username = self.usernameTextField.text;
    NSString * password = self.passwordTextField.text;
    
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError * error) {
        if (user) {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            SelfieTableViewController * destinationVC = [storyboard instantiateViewControllerWithIdentifier:@"SelfieTableViewController"];
       
        } else {
            NSLog(@"loginUnsuccesful");

        }
    }];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
