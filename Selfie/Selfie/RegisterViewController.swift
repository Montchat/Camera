//
//  RegisterViewController.swift
//  Selfie
//
//  Created by Joe E. on 11/3/15.
//  Copyright © 2015 Joe E. All rights reserved.
//

import UIKit

private let AVATARVC = "AvatarVC"

class RegisterViewController: UIViewController {
    
    //MARK: - @IBOutlets
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var signUp: UIButton!
    
    //MARK - @IBActions
    @IBAction func signUp(sender:AnyObject) {
        
    }
    
    @IBAction func nextButtonPressed(sender:AnyObject) {
        if let avatarVC = self.storyboard?.instantiateViewControllerWithIdentifier(AVATARVC) as? AvatarViewController {
            if let username = usernameTextField.text, let password = passwordTextField.text, let email = emailTextField.text {
                avatarVC.username = username; avatarVC.password = password; avatarVC.email = email
                
            }
            
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

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
