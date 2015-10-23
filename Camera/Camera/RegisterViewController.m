//
//  RegisterViewController.m
//  Camera
//
//  Created by Joe E. on 10/19/15.
//  Copyright © 2015 Joe E. All rights reserved.
//

#import "RegisterViewController.h"
#import <Parse/Parse.h>

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (IBAction)signUp:(id)sender {
    PFUser * user = [PFUser user];
    user.username = (@"@%", self.usernameTextField.text);
    user.password = (@"@%", self.passwordTextField.text);
    user.email = (@"@%", self.emailTextField.text);
    
    [user signUpInBackground];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

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

