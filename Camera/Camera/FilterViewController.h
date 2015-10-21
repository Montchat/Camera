//
//  FilterViewController.h
//  Camera
//
//  Created by Joe E. on 10/19/15.
//  Copyright © 2015 Joe E. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FilterViewController : UIViewController

@property UIImage * originalImage;

@property (weak, nonatomic) IBOutlet UIImageView *filterImageView;
@property (weak, nonatomic) IBOutlet UIButton *previewButton;



@end
