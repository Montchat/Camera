//
//  AvatarViewController.swift
//  Selfie
//
//  Created by Joe E. on 11/3/15.
//  Copyright © 2015 Joe E. All rights reserved.
//

import UIKit
import Parse

private let CREATE = "Create"
private let SELFIE_TABLE_VC = "SelfieTableVC"

class AvatarViewController: UIViewController {
    
    //Properties
    var username = String()
    var password = String()
    var email = String()
    var avatarImage = UIImage()
    
    //MARK: - @IBOutlets
    @IBOutlet var avatarImageButton: UIButton!
    @IBOutlet var registerButon: UIButton!
    
    //MARK: - @IBActions
    @IBAction func avatarButtonPressed(sender:AnyObject) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .Camera
        imagePicker.delegate = self
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func registerButtonPressed(sender:AnyObject) {
        let user = PFUser()
        user.username = username
        user.password = password
        user.email = email
        
        user.saveInBackground()
        
        let storyboard = UIStoryboard(name: CREATE, bundle: nil).instantiateViewControllerWithIdentifier(SELFIE_TABLE_VC)
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}

extension AvatarViewController : UINavigationControllerDelegate {
    
}

extension AvatarViewController : UIImagePickerControllerDelegate {
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
    }
    
}