//
//  FilterViewController.m
//  Camera
//
//  Created by Joe E. on 10/19/15.
//  Copyright © 2015 Joe E. All rights reserved.
//

#import "FilterViewController.h"
#import "SubmitViewController.h"

@interface FilterViewController ()

@end

@implementation FilterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.filterImageView.image = self.originalImage;
 
}

- (void)viewDidAppear:(BOOL)animated {
    self.filterImageView.image = self.originalImage;
    self.filterImageView.contentMode = UIViewContentModeScaleAspectFit;

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)previewPressed:(id)sender {
    
    SubmitViewController * vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SubmitVC"];
    vc.originalImage = self.originalImage;
    [self.navigationController pushViewController:vc animated:YES];
    
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
