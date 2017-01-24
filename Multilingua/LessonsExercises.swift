//
//  LessonsExercises.swift
//  Multilingua
//
//  Created by Oliv on 23/01/2017.
//  Copyright © 2017 Oliv. All rights reserved.
//

import UIKit

class LessonsExercises: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var tableView: UITableView!
    
    let lessons = ["Leçon du jour", "Leçon d'hier", "Leçon d'avant-hier"]
    let textCellIdentifier = "TextCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: textCellIdentifier)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_dashboard"), style: .plain, target: self, action: #selector(dashIconTouched))

    }
    
    func dashIconTouched(sender: UIBarButtonItem){
        let destinationViewController = navigationController?.storyboard?.instantiateViewController(withIdentifier: "dashboard") as? Dashboard
        navigationController?.pushViewController(destinationViewController!, animated: true)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lessons.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "basic")
        cell.textLabel?.text = String(lessons[indexPath.row])
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let backItem = UIBarButtonItem()
        backItem.title = "Retour"
        navigationItem.backBarButtonItem = backItem
        if indexPath.row == 0 {
        //if such cell exists and destination controller (the one to show) exists too..
        if let _ = tableView.cellForRow(at: indexPath as IndexPath), let destinationViewController = navigationController?.storyboard?.instantiateViewController(withIdentifier: "lessonDay") as? LessonDay{
//            //This is a bonus, I will be showing at destionation controller the same text of the cell from where it comes...
//            if let text = subjectCell.textLabel?.text {
//                destinationViewController.textToShow = text
//            } else {
//                destinationViewController.textToShow = "Tapped Cell's textLabel is empty"
//            }
            //Then just push the controller into the view hierarchy
            navigationController?.pushViewController(destinationViewController, animated: true)
            }
        }
        if indexPath.row == 1 {
            //if such cell exists and destination controller (the one to show) exists too..
            if let _ = tableView.cellForRow(at: indexPath as IndexPath), let destinationViewController = navigationController?.storyboard?.instantiateViewController(withIdentifier: "lessonYesterday") as? LessonYesterday{
                //Then just push the controller into the view hierarchy
                navigationController?.pushViewController(destinationViewController, animated: true)
            }
        }
        if indexPath.row == 2 {
            //if such cell exists and destination controller (the one to show) exists too..
            if let _ = tableView.cellForRow(at: indexPath as IndexPath), let destinationViewController = navigationController?.storyboard?.instantiateViewController(withIdentifier: "lessonBeforeYesterday") as? LessonBeforeYesterday{
                //Then just push the controller into the view hierarchy
                navigationController?.pushViewController(destinationViewController, animated: true)
            }
        }
    }
    
}
