//
//  FilterViewController.swift
//  Selfie
//
//  Created by Joe E. on 11/1/15.
//  Copyright © 2015 Joe E. All rights reserved.
//

import UIKit

private let SUBMITVC = "SubmitVC"

typealias FilterNames = NSArray
class FilterViewController: UIViewController {
    
    //MARK: - Properties
    var originalImage = UIImage()
    var filterNames = FilterNames()
    
    //MARK: - @IBOutlets
    @IBOutlet var filterImageView: UIImageView!
    @IBOutlet var filterCollectionView: UICollectionView!
    
    //MARK: - @IBActions
    @IBAction func pressedNext(sender:AnyObject) {
        if let submitVC = storyboard?.instantiateViewControllerWithIdentifier(SUBMITVC) as? SubmitViewController {
            submitVC.filteredImage = filterImageView.image!
            navigationController?.pushViewController(submitVC, animated: true)
            
        }
        
    }
    
    //MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filterImageView.image = originalImage
        setDelegatesOf(filterCollectionView)
        
        filterNames = CIFilter.filterNamesInCategory(kCICategoryColorEffect)
        filterCollectionView.reloadData()
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filterNames.count
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension FilterViewController: UICollectionViewDataSource {

    
}

extension FilterViewController: UICollectionViewDelegate {
    func setDelegatesOf(filterCollectionView: UICollectionView) {
        filterCollectionView.delegate = self
        filterCollectionView.dataSource = self
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var newCell = FilterCollectionViewCell()
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("FilterCell", forIndexPath: indexPath) as? FilterCollectionViewCell {
            cell.filterName = filterNames[indexPath.item] as! String
            
            let resizedImage = resizeImage(originalImage, CGSizeMake(80,80))
            cell.originalImage = resizedImage
            
            newCell = cell
            
        }
        
        return newCell
       
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        if let cell = collectionView.cellForItemAtIndexPath(indexPath) as? FilterCollectionViewCell {
            filterImageView.image = filterImage(originalImage, cell.filterName)
        }
        
    }
    
}
