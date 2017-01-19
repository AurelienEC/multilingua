//
//  Register.swift
//  Multilingua
//
//  Created by Oliv on 19/01/2017.
//  Copyright © 2017 Oliv. All rights reserved.
//

import UIKit
import Parse

class Register: ViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var repeatPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func registerButtonTapped(sender: AnyObject) {
        
        let user = username.text;
        let pass = password.text;
        let repPass = repeatPassword.text;
        
        // Check for empty fields
        if((user?.isEmpty)! || (pass?.isEmpty)! || (repPass?.isEmpty)!)
        {
            
            // Display alert message
            
            displayMyAlertMessage(userMessage: "Merci de remplir tous les champs");
            
            return;
        }
        
        //Check if passwords match
        if(pass != repPass)
        {
            // Display an alert message
            displayMyAlertMessage(userMessage: "Les mots de passe ne sont pas identiques");
            return;
            
        }
        
        
        
        
        // Store data
        let myUser:PFUser = PFUser();
        
        myUser.username = user
        myUser.password = pass

        
        myUser.signUpInBackgroundWithBlock {
            (success:Bool!, error:NSError!) -> Void in
            
            println("User successfully registered")
            
            // Display alert message with confirmation.
            var myAlert = UIAlertController(title:"Alert", message:"Registration is successful. Thank you!", preferredStyle: UIAlertControllerStyle.Alert);
            
            let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.Default){ action in
                self.dismissViewControllerAnimated(true, completion:nil);
            }
            
            myAlert.addAction(okAction);
            self.presentViewController(myAlert, animated:true, completion:nil);
            
            
        }
        
        
        
        
        
        
    }
    
    
    func displayMyAlertMessage(userMessage:String)
    {
        
        var myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.Alert);
        
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.Default, handler:nil);
        
        myAlert.addAction(okAction);
        
        self.presentViewController(myAlert, animated:true, completion:nil);
        
    }
    
    @IBAction func iHaveAnAccountButtonTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    
}
