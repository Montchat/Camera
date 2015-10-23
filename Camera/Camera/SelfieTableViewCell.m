//
//  SelfieTableViewCell.m
//  Camera
//
//  Created by Joe E. on 10/19/15.
//  Copyright © 2015 Joe E. All rights reserved.
//

#import "SelfieTableViewCell.h"

@interface SelfieTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *selfieImageView;

@end

@implementation SelfieTableViewCell

//set image based on selfie["image"]

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void) setSelfie:(PFObject *)selfie {
    _selfie = selfie;
    [self updateInfo];

}

- (void)updateInfo {
    
    PFFile *userImageFile = self.selfie[@"image"];
    NSLog(@"userImageFile is working");
    [userImageFile getDataInBackgroundWithBlock:^(NSData * imageData, NSError * _Nullable error) {
        if (!error) {
            UIImage * image = [UIImage imageWithData:imageData];
        }
        
    }];
    
//    self.selfieImageView.image = self.selfie[@"image"];
}

@end
