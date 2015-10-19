//
//  ViewController.m
//  Camera
//
//  Created by Joe E. on 10/19/15.
//  Copyright © 2015 Joe E. All rights reserved.
//

#import "ViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property UIImagePickerController * pickerController;

@property (weak, nonatomic) IBOutlet UIImageView *mySelfieImageView;

@end

@implementation ViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    
    if (self != nil) {
        self.pickerController = [[UIImagePickerController alloc] init];
        self.pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        self.pickerController.cameraDevice = UIImagePickerControllerCameraDeviceFront;
        self.pickerController.delegate = self;

    }
    
    return self;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewDidAppear:(BOOL)animated {
    if (self.mySelfieImageView.image == nil) {
        [self presentViewController:self.pickerController animated:YES completion:nil];
        
    }
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    NSString * type = info[UIImagePickerControllerMediaType];
    
    if (type == (NSString *)kUTTypeImage) {
        UIImage * image = info[UIImagePickerControllerOriginalImage];
        
        self.mySelfieImageView.image = image;
        
    }
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
