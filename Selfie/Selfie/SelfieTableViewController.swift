//
//  SelfieTableViewController.swift
//  Selfie
//
//  Created by Joe E. on 11/1/15.
//  Copyright © 2015 Joe E. All rights reserved.
//

import UIKit
import Parse

private let USER = "user"
private let LOGOUT = "logout"
private let VIEWDIDLOAD = "viewDidLoad"
private let SELFIE = "Selfie"

class SelfieTableViewController: UITableViewController {
    var selfies:NSMutableArray = NSMutableArray()
    
    func logout() {
        PFUser.logOut()
        let nc = UIStoryboard(name: USER, bundle: nil).instantiateInitialViewController()
        UIApplication.sharedApplication().windows[0].rootViewController = nc
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog(VIEWDIDLOAD)
        
        let logoutButton = UIBarButtonItem(title: LOGOUT, style: UIBarButtonItemStyle.Plain, target: self, action: "logout")
        self.navigationItem.leftBarButtonItem = logoutButton
        
        selfies = [mutableCopy()]
        
        let selfieQuery = PFQuery(className: SELFIE)
        selfieQuery.findObjectsInBackgroundWithBlock { (selfies: [PFObject]?, error:NSError?) -> Void in
            if error == nil {
                for selfie in selfies! {
                    NSLog("%@", selfie)
                    self.selfies.addObject(selfie)
                
            }
                NSLog("queryDidFinish")
                self.tableView.reloadData()

            }
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection
        section: Int) -> Int {
            NSLog("%@", selfies)
            NSLog("current selfies count: %d", selfies.count)
            return selfies.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> SelfieTableViewCell {
        let cell = SelfieTableViewCell()
        if let cell = tableView.dequeueReusableCellWithIdentifier("SelfieCell", forIndexPath: indexPath) as? SelfieTableViewCell {
                cell.selfie = selfies[indexPath.row] as! PFObject
            
        }
        
        return cell
        
    }

}