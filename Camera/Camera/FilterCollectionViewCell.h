//
//  FilterCollectionViewCell.h
//  Camera
//
//  Created by Joe E. on 10/19/15.
//  Copyright © 2015 Joe E. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FilterCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *filterImageView;

@property UIImage * originalImage;
@property NSString * filterName; 

@end
