//
//  NextDatesViewController.swift
//  Multilingua
//
//  Created by Oliv on 23/01/2017.
//  Copyright © 2017 Oliv. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

class NextDatesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
 
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var checkBoxButton: CheckBox!
    var isCheckboxChecked:Bool!
    
    let dates = ["Anglais: Le Mardi 31 Janvier à 16:40", "Anglais: Mercredi 01 Fevrier à 11:30", "Espagnol: Jeudi 02 Fevrier à 13:45"]
    let textCellIdentifier = "TextCell"
    var isGrantedNotificationAccess:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isCheckboxChecked = false
        tableView.delegate = self
        tableView.dataSource = self
        UNUserNotificationCenter.current().requestAuthorization(
            options: [.alert,.sound,.badge],
            completionHandler: { (granted,error) in
                self.isGrantedNotificationAccess = granted
            }
        )
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dates.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "basic")
        cell.textLabel?.text = String(dates[indexPath.row])
        return cell
    }
    
    @IBAction func checkboxTapped(_ sender: CheckBox) {
        if isCheckboxChecked == true{
            isCheckboxChecked = false
        }
        else{
            isCheckboxChecked = true
        }
        
        if isCheckboxChecked == true{
            // Active les notif
            if isGrantedNotificationAccess{
                //Ancien Code
                let content = UNMutableNotificationContent()
                content.title = "Rappel pour votre Formation"
                content.body = "Nous vous rappellons qu'une formation est prévue dans une heure"
                content.sound = UNNotificationSound.default()

                let calendar = Calendar.current
                let reminderNextFormation = DateComponents(month: 1, day: 31, hour: 17, minute: 25)
                let nextFormationDate = calendar.date(from: reminderNextFormation)
                let components = calendar.dateComponents(in: .current, from: nextFormationDate!)
                let newComponents = DateComponents(calendar: calendar, timeZone: .current, month: components.month, day: components.day, hour: components.hour, minute: components.minute)
                let trigger = UNCalendarNotificationTrigger(dateMatching: newComponents, repeats: false)
                let request = UNNotificationRequest(identifier: "textNotification", content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                UNUserNotificationCenter.current().add(request) {(error) in
                    if let error = error {
                        print("Oops! Une erreur s'est glissée: \(error)")
                    }
                }
            }
        }
        else{
            //Desactive les notif
        }
    }

}
