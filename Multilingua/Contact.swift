//
//  Contact.swift
//  Multilingua
//
//  Created by Oliv on 23/01/2017.
//  Copyright © 2017 Oliv. All rights reserved.
//

import UIKit

class Contact: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet var tableView: UITableView!
    
    let contactTypes = ["Contacter par Téléphone", "Contacter par Mail"]
    let textCellIdentifier = "TextCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: textCellIdentifier)
        
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
}
