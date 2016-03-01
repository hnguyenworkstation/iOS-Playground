//
//  LoginPageViewController.swift
//  UserLogin
//
//  Created by Hung Nguyen on 2/29/16.
//  Copyright © 2016 Hung Nguyen. All rights reserved.
//

import UIKit

class LoginPageViewController: UIViewController {
    @IBOutlet weak var txt_userEmail: UITextField!
    @IBOutlet weak var txt_userPassword: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func LoginButtonTapped(sender: AnyObject) {
        let userEmail = txt_userEmail.text;
        let userPassword = txt_userPassword.text;
        
        let userEmailStored = NSUserDefaults.standardUserDefaults().stringForKey("userEmail");
        
        let userPasswordStored = NSUserDefaults.standardUserDefaults().stringForKey("userPassword");
        
        if (userEmail == userEmailStored) {
            if (userPassword == userPasswordStored) {
                // Login Sucessful
                NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isUserLoggedIn");
                NSUserDefaults.standardUserDefaults().synchronize();
                self.dismissViewControllerAnimated(true, completion: nil);
            }
        }
    }
    
}
