//
//  FilterViewController.m
//  Camera
//
//  Created by Joe E. on 10/19/15.
//  Copyright © 2015 Joe E. All rights reserved.
//

#import "FilterViewController.h"

@interface FilterViewController ()

// MARK: - @properties
@property (weak, nonatomic) IBOutlet UIImageView *pictureImageview;
@property (weak, nonatomic) IBOutlet UICollectionView *filterCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewCell *filterView;
@property (weak, nonatomic) IBOutlet UIButton *selectFilterButton;

//MARK: - IBActions
- (IBAction)selectFilterPressed:(id)sender;

@end

@implementation FilterViewController

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

- (IBAction)selectFilterPressed:(id)sender {
}
@end
