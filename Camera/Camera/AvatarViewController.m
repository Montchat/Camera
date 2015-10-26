//
//  AvatarViewController.m
//  Camera
//
//  Created by Joe E. on 10/19/15.
//  Copyright © 2015 Joe E. All rights reserved.
//

#import "AvatarViewController.h"
#import <Parse/Parse.h>

@interface AvatarViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@end

@implementation AvatarViewController

- (IBAction)avatarButtonPressed:(id)sender {
    UIImagePickerController * imagePicker = [[UIImagePickerController alloc]init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePicker.delegate = self;
    [self presentViewController:imagePicker animated:true completion:^{

    }];
    
}



- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    //attempting to set up the image
    
//    if (imagePicker) {

//        UIIm
//        self.avatarImageButton set
//        self.avatarImageButto n setImage:<#(nullable UIImage *)#> forState:<#(UIControlState)#>
    
//    }

}

- (IBAction)registerButtonPressed:(id)sender {
    PFUser * user = [PFUser user];
    user.username = self.username;
    user.password = self.password;
    user.email = self.email;
    
    [user saveInBackground];
    
    UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"Create" bundle:nil];
    [storyboard instantiateViewControllerWithIdentifier:@"SelfieTableVC"];

}

- (void)viewDidLoad {
    [super viewDidLoad];
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

}


@end
