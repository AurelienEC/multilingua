//
//  SignIn.swift
//  Multilingua
//
//  Created by Oliv on 18/01/2017.
//  Copyright © 2017 Oliv. All rights reserved.
//

import UIKit

class SignIn: UIViewController
{
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    //    let users = Users.userData(Users)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func connectButton(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        let usersAndPasses = ["Jean":"1234","Phil":"1234","Alex":"1234","Brian":"1234"]
        let users = [String](usersAndPasses.keys)
        
        defaults.setValuesForKeys(usersAndPasses)
        
        if let user = username.text{
            if let pass = password.text{
                if users.contains(user) && pass == usersAndPasses[user]{
                        
                        // Connection OK
                        UserDefaults.standard.set(true, forKey: "isLoggedIn")
                        //                        UserDefaults.standard.synchronize()
                        self.dismiss(animated: true, completion: nil)
                        
                    
                    
                }
                else{
                    //Creating the alert controller
                    //It takes the title and the alert message and prefferred style
                    let alertController = UIAlertController(title: "Erreur", message: "L'identifiant ou le mot de passe sont erronés", preferredStyle: .alert)
                    
                    //then we create a default action for the alert...
                    //It is actually a button and we have given the button text style and handler
                    //currently handler is nil as we are not specifying any handler
                    let defaultAction = UIAlertAction(title: "Fermer", style: .default, handler: nil)
                    
                    //now we are adding the default action to our alertcontroller
                    alertController.addAction(defaultAction)
                    
                    //and finally presenting our alert using this method
                    present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
}

