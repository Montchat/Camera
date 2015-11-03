//
//  FilterCollectionViewCell.swift
//  Selfie
//
//  Created by Joe E. on 11/2/15.
//  Copyright © 2015 Joe E. All rights reserved.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    var originalImage = UIImage()
    var filterName = String()
    
    //MARK: @IBOutlets
    @IBOutlet var filterImageView: UIImageView!
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
//        filterImageView.image = filterImage(self.originalImage, filterName as String)
    }
    
    func filterImage() {
    
    }
    
    func runFilterInBackground() {
        
        
    }
    
}
