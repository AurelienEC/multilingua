//
//  SignInViewController.swift
//  Multilingua
//
//  Created by Oliv on 18/01/2017.
//  Copyright © 2017 Oliv. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate
{
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 5
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SignInViewController.dismissKeyboard))
        //Uncomment the line below if you want the tap not to interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        username.delegate = self
        password.delegate = self
        username.tag = 0
        password.tag = 1
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Try to find next responder
        if let textField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField{
            textField.becomeFirstResponder()
            print("dans le if")
            
        }
        /*if textField === password{
            On pourrait ici definir l'action de connexion au clic sur le bouton return du clavier
        }*/
        else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
            print("dans le else")
        }
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if (Users.login(username:username.text, password: password.text) != nil){            
            return true
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
            
            return false
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "logInSegue"{
            
            _ = segue.destination as! UINavigationController
//            dashboard.stringPassed = username.text!
        }
    }
}

