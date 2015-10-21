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

@end

@implementation SubmitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pictureImageView.image = self.originalImage;


}

- (void)viewDidAppear:(BOOL)animated {
    self.pictureImageView.image = self.originalImage;
    self.pictureImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)submitSelfie:(id)sender {
    PFObject * selfie = [PFObject objectWithClassName:@"Selfie"];
    UIImage * image = self.pictureImageView.image;
    NSData * _Nullable UIImageJPEGRepresentation (UIImage * image, CGFloat compressionQuality);
//    selfie[@"image"] = self.pictureImageView.image;
    selfie[@"caption"] = self.captionTextView.text;
    
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
