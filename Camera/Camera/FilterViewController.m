//
//  FilterViewController.m
//  Camera
//
//  Created by Joe E. on 10/19/15.
//  Copyright © 2015 Joe E. All rights reserved.
//

#import "FilterViewController.h"
#import "FilterCollectionViewCell.h"
#import "ImageEditing.h"

@interface FilterViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *filterImageView;
@property (weak, nonatomic) IBOutlet UICollectionView *filterCollectionView;

@end

@implementation FilterViewController
{
    NSArray * filterNames;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.filterImageView.image = self.originalImage;
    
    self.filterCollectionView.dataSource = self;
    self.filterCollectionView.delegate = self;
    
    filterNames = [CIFilter filterNamesInCategory:kCICategoryColorEffect];
    [self.filterCollectionView reloadData];
 
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return filterNames.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    FilterCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FilterCell" forIndexPath:indexPath];
    
    cell.filterName = filterNames[indexPath.item];
    
    UIImage * resizedImage = resizeImage(self.originalImage, CGSizeMake(80, 80));
    cell.originalImage = resizedImage;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    FilterCollectionViewCell * cell = (FilterCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    self.filterImageView.image = filterImage(self.originalImage, cell.filterName);
    
}

@end


