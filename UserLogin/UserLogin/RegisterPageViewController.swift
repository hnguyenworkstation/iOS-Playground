//
//  RegisterPageViewController.swift
//  UserLogin
//
//  Created by Hung Nguyen on 2/28/16.
//  Copyright © 2016 Hung Nguyen. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController {
    
    @IBOutlet weak var txtUserEmail: UITextField!
    @IBOutlet weak var txtUserPassword: UITextField!
    @IBOutlet weak var txtUserPasswordRepeat: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnRegisterTapped(sender: AnyObject) {
        //get user information
        let userEmail = txtUserEmail.text;
        let userPassword = txtUserPassword.text;
        let userPasswordRepeat = txtUserPasswordRepeat.text;
        
        // Check if there is any empty field
        if( userEmail.isEmpty || userPassword.isEmpty || userPasswordRepeat.isEmpty) {
            // display alert message
            displayAlertMessage("There is an empty field..");
            
            return;
        }
        
        // Check if the repeat password is not matched
        if(userPasswordRepeat != userPassword) {
            // display alert message
            displayAlertMessage("Your passwords are not matched...");
            return;
        }
        
        // Get user information
        NSUserDefaults.standardUserDefaults().setObject(userEmail, forKey: "userEmail");
        NSUserDefaults.standardUserDefaults().setObject(userPassword, forKey: "userPassword");
        NSUserDefaults.standardUserDefaults().synchronize();
        
        // Display confirmation
        var myAlert = UIAlertController(title: "Confirmation", message: "Registration Sucessful!", preferredStyle: UIAlertControllerStyle.Alert);
        let okAction = UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil);
        
        myAlert.addAction(okAction);
        self.presentViewController(myAlert, animated: true, completion: nil);
        
    }
    
    func displayAlertMessage(userMessage:String) {
        var myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert);
    
        let okAction = UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil);
        
        myAlert.addAction(okAction);
        
        self.presentViewController(myAlert, animated: true, completion: nil);
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
