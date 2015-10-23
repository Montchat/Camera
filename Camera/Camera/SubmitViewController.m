//
//  SubmitViewController.m
//  Camera
//
//  Created by Joe E. on 10/19/15.
//  Copyright © 2015 Joe E. All rights reserved.
//

#import "SubmitViewController.h"
#import <Parse/Parse.h>

@interface SubmitViewController ()

@property (weak, nonatomic) IBOutlet UITextView *captionTextView;
@property (weak, nonatomic) IBOutlet UIImageView *filteredImageView;

@end

@implementation SubmitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void) viewWillAppear:(BOOL)animated {
    
    self.filteredImageView.image = self.filteredImage;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)submitSelfie:(id)sender {
    PFObject * selfie = [PFObject objectWithClassName:@"Selfie"];
    
    NSData * imageData = UIImagePNGRepresentation(self.filteredImage);
    PFFile * imageFile = [PFFile fileWithData:imageData];
    selfie[@"image"] = imageFile; // PFFile column
    selfie[@"caption"] = self.captionTextView.text; //String column
    selfie[@"user"]  = [PFUser currentUser]; //Pointer -> _User column
    
    [selfie saveInBackground];
    
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
