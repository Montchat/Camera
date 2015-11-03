//
//  SubmitViewController.swift
//  Selfie
//
//  Created by Joe E. on 11/2/15.
//  Copyright © 2015 Joe E. All rights reserved.
//

import UIKit
import Parse

private let SELFIE = "Selfie"
private let IMAGE = "image"
private let CAPTION = "caption"
private let USER = "user"

class SubmitViewController: UIViewController {
    //MARK: - Properties
    var filteredImage = UIImage()
    
    //MARK: - @IBOutlets
    @IBOutlet var captionTextView: UITextView!
    @IBOutlet var filteredImageView: UIImageView!
    
    //MARK - @IBActions
    @IBAction func submitSelfie(sender:AnyObject) {
        let selfie: PFObject = PFObject(className: SELFIE)
        
        if let imageData = UIImagePNGRepresentation(filteredImage) {
            let imageFile = PFFile(data: imageData)
            selfie[IMAGE] = imageFile
            selfie[CAPTION] = captionTextView.text
            selfie[USER] = PFUser.currentUser()
            
            selfie.saveInBackground()
            
        }
        
    }
    //MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - viewWillAppear()
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        filteredImageView.image = filteredImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
}
