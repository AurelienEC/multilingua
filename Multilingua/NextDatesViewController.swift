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
    
    //on définit les prochaines date de formations ici
    let formations: [LessonNotifications] = [
        LessonNotifications(kind: .spanish, date: calendar.date(from: DateComponents(year: 2017, month: 2, day: 1, hour: 15, minute: 26))!),
        LessonNotifications(kind: .english, date: calendar.date(from: DateComponents(year: 2017, month: 12, day: 29, hour: 13, minute: 30))!),
        LessonNotifications(kind: .english, date: calendar.date(from: DateComponents(year: 2017, month: 12, day: 21, hour: 18, minute: 30))!)
    ]
    
    let textCellIdentifier = "TextCell"
    var isGrantedNotificationAccess:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = Calendar.autoupdatingCurrent
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
        return formations.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "basic")
        cell.textLabel?.text = String(describing: formations[indexPath.row].text)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { // Empêcher les  cellules de rester séléectionnées
        tableView.deselectRow(at: indexPath, animated: true)
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

                let content = UNMutableNotificationContent()
                content.title = "Rappel pour votre Formation"
                content.body = "Nous vous rappellons qu'une formation est prévue dans une heure"
                content.sound = UNNotificationSound.default()
                
                let nextFormationDate = formations[0].date
                let components = calendar.dateComponents(in: .current, from: nextFormationDate)
                let newComponents = DateComponents(calendar: calendar, timeZone: .current, month: components.month, day: components.day, hour: components.hour, minute: components.minute)
                
                var trigger: UNCalendarNotificationTrigger {
                    let triggerDate = calendar.date(byAdding: .hour, value: LessonNotifications.triggerHourDifference, to: formations[0].date)
                    let components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: triggerDate!)
                    
                    return UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
                }
                let request = UNNotificationRequest(identifier: "textNotification", content: content, trigger: trigger)
                UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                UNUserNotificationCenter.current().add(request) {(error) in
                    if let error = error {
                        print("Oops! Une erreur s'est glissée: \(error)")
                    }
                }
            print(nextFormationDate)
            }
        }
        else{
            //Desactive les notif
        }
    }

}
