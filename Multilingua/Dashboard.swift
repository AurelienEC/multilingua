//
//  Dashboard.swift
//  Multilingua
//
//  Created by Oliv on 18/01/2017.
//  Copyright © 2017 Oliv. All rights reserved.
//

import UIKit

class Dashboard: UIViewController {
    
    var time = Timer()
    var stringPassed = ""
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    
    @IBOutlet weak var lessonsImage: UIImageView!
    @IBOutlet weak var calendarImage: UIImageView!
    @IBOutlet weak var contactImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(Dashboard.date), userInfo: nil, repeats: true)
        userLabel.text = "Bonjour, " + stringPassed
        userLabel.textAlignment = NSTextAlignment.center
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func date(){
        let date = DateFormatter()
        date.dateStyle = .full
        dateLabel.text = date.string(from: Date())
        dateLabel.textAlignment = NSTextAlignment.center
    }
    
    @IBAction func lessonsClic(sender : UIButton) {
        //On récupère Main.storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //On crée une instance d'Exercice à partir du storyboard
        let lessons = storyboard.instantiateViewController(withIdentifier: "lessons") as! LessonsExercises
        //On montre le nouveau controller
        navigationController?.show(lessons, sender: self)
    }
    
    @IBAction func calendarClic(sender : UIButton) {
        //On récupère Main.storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //On crée une instance d'Exercice à partir du storyboard
        let calendar = storyboard.instantiateViewController(withIdentifier: "calendar") as! NextDates
        //On montre le nouveau controller
        navigationController?.show(calendar, sender: self)
    }
//
//    @IBAction func contactClic(sender : UIButton) {
//        //On récupère Main.storyboard
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        //On crée une instance d'Exercice à partir du storyboard
//        let lessons = storyboard.instantiateViewController(withIdentifier: "lessons") as! LessonsExercices
//        //On montre le nouveau controller
//        navigationController?.show(lessons, sender: self)
//    }
    
}
