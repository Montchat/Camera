//
//  SelfieTableViewCell.swift
//  Selfie
//
//  Created by Joe E. on 11/1/15.
//  Copyright © 2015 Joe E. All rights reserved.
//

import UIKit
import Parse

//Strings
private let IMAGE = "image"

class SelfieTableViewCell: UITableViewCell {
    
    var selfie = PFObject()
    
    func selectSelfie(selfie:PFObject) {
        self.selfie = selfie
        self.updateInfo()
        
    }
    
    func updateInfo() {
        let userImageFile = selfie[IMAGE]
        NSLog("userImageFileIsWorking")
        userImageFile.getDataInBackgroundWithBlock { (imageData:NSData?, error:NSError?) -> Void in
            if error == nil {
                let image = UIImage(data: imageData!)
            }
        }
    
    
    }

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
