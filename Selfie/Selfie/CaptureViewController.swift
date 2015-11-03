//
//  CaptureViewController.swift
//  Selfie
//
//  Created by Joe E. on 11/1/15.
//  Copyright © 2015 Joe E. All rights reserved.
//

import UIKit

private let FILTER_VC = "FilterVC"
class CaptureViewController: UIViewController {
    
    //MARK: - Properties
    var picker = UIImagePickerController()
    
    //MARK: - @IBOutlets
    @IBOutlet var cameraHolderView: UIView!
    
    //MARK: - @IBActions
    @IBAction func takePicture(sender: AnyObject) {
        picker.takePicture()
    }

    //MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setNeedsUpdateConstraints()
        view.setNeedsLayout()
        
        initalizeImagePickerContoller(picker)
        createNewFrameFrom(picker)
        
    }
    
    
    //MARK: - viewDidLayoutSubviews()
    override func viewDidLayoutSubviews() {
        NSLog("%f %f", cameraHolderView.bounds.size.width, cameraHolderView.bounds.size.height)

    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
}

//MARK: - Extenstions
extension CaptureViewController: UINavigationControllerDelegate {
    
}

extension CaptureViewController: UIImagePickerControllerDelegate {
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        if let filterVC = storyboard?.instantiateViewControllerWithIdentifier(FILTER_VC) as? FilterViewController {
            filterVC.originalImage = flipImage(image)
            navigationController?.pushViewController(filterVC, animated: true)
            
        }
        
    }
    
    func initalizeImagePickerContoller(picker:UIImagePickerController) {
        picker.sourceType = UIImagePickerControllerSourceType.Camera
        picker.cameraDevice = UIImagePickerControllerCameraDevice.Front
        picker.delegate = self
        picker.showsCameraControls = false
        
    }
    
}

extension CaptureViewController {
    func createNewFrameFrom(picker:UIImagePickerController) {
        var newFrame = picker.view.frame
        newFrame.size.width = newFrame.size.height / 4 * 3
        NSLog("%f %f", newFrame.size.width, newFrame.size.width)
        picker.view.frame = newFrame
        
    }
    
}