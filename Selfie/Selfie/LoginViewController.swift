//
//  LoginViewController.swift
//  Selfie
//
//  Created by Joe E. on 11/2/15.
//  Copyright © 2015 Joe E. All rights reserved.
//

import UIKit
import Parse

private let MAIN = "Main"
private let SELFIE_TABLE_VIEW_CONTROLLER = "SelfieTableViewController"

class LoginViewController: UIViewController {
    
    
    //MARK: - @IBOutlets
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    //MARK: - @IBActions
    @IBAction func loginButtonPressed(sender:AnyObject) {
        if let username = usernameTextField.text, let password = passwordTextField.text {
            PFUser.logInWithUsernameInBackground(username, password: password) { (user:PFUser?, error: NSError?) -> Void in
                
                if user != nil {
                    let storyboard: UIStoryboard = UIStoryboard(name: MAIN, bundle: nil)
                    let destinationVC = storyboard.instantiateViewControllerWithIdentifier(SELFIE_TABLE_VIEW_CONTROLLER)
                    
                } else {
                    NSLog("loginUnsuccesful")
                    
                }
                
            }
            
        }
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
