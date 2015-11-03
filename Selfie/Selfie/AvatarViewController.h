//
//  AvatarViewController.h
//  Camera
//
//  Created by Joe E. on 10/19/15.
//  Copyright © 2015 Joe E. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AvatarViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *avatarImageButton;
@property (weak, nonatomic) IBOutlet UIButton *registerButon;

@property NSString * username;
@property NSString * password;
@property NSString * email;
@property UIImage * avatarImage;

@end
