//
//  ContactViewController.swift
//  Multilingua
//
//  Created by Oliv on 23/01/2017.
//  Copyright © 2017 Oliv. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var notificationButton: UIButton!
    var clearsSelectionOnViewWillAppear:Bool = true
    
    let contactTypes = ["Contacter par Téléphone", "Contacter par Mail"]
    let textCellIdentifier = "TextCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: textCellIdentifier)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //On récupère le numéro de section concerné
        switch section {
        case 0: return "Contacter son Responsable de Formation"
        default: return ""
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactTypes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "basic")
        cell.textLabel?.text = String(contactTypes[indexPath.row])
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            let phoneNumber:String? = "0507712323"
            if let callNumber = phoneNumber {
                
                let aURL = NSURL(string: "tel://\(callNumber)")
                if UIApplication.shared.canOpenURL(aURL as! URL) {
                    UIApplication.shared.open(aURL as! URL, options: [:], completionHandler: nil)
                } else {
                    let alertController = UIAlertController(title: "Appeler mon Responsable", message: "Impossible de tester le Dialer sur le simulateur", preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "Fermer", style: .default, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    present(alertController, animated: true, completion: nil)
                    print("Erreur car nous ne pouvons ouvrir le Dialer sur le simulateur")
                }
            }
            else {
                print("error")}
        }
        if indexPath.row == 1{
            let email = "responsable@multlingua.com"
            let url = URL(string: "mailto:\(email)")
            UIApplication.shared.open(url!)
            let alertController = UIAlertController(title: "Envoyer un mail", message: "Impossible de tester l'envoi d'un mail sur le simulateur", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Fermer", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            print("Erreur car nous ne pouvons envoyer un mail via le simulateur")
        }
        print(contactTypes[indexPath.row])
    }
    
}
