//
//  FilterCollectionViewCell.m
//  Camera
//
//  Created by Joe E. on 10/19/15.
//  Copyright © 2015 Joe E. All rights reserved.
//

#import "FilterCollectionViewCell.h"
#import "ImageEditing.h"

@implementation FilterCollectionViewCell

- (void)didMoveToWindow {
//    [self filterImage];
    self.filterImageView.image = filterImage(self.originalImage, self.filterName);
    
}

- (void)prepareForReuse {
//    [self filterImage];
    self.filterImageView.image = filterImage(self.originalImage, self.filterName);
}

- (void)filterImage {
   // [self filterImage];
    
}

- (void) runFilterInBackground {

}


@end
