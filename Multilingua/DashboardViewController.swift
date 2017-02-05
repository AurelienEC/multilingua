//
//  DashboardViewController.swift
//  Multilingua
//
//  Created by Oliv on 18/01/2017.
//  Copyright © 2017 Oliv. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    
    var time = Timer()
    var stringPassed = ""
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    
    @IBOutlet weak var lessonsImage: UIImageView!
    @IBOutlet weak var calendarImage: UIImageView!
    @IBOutlet weak var contactImage: UIImageView!
    
    @IBOutlet weak var logOutButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        logOutButton.layer.cornerRadius = 5
        time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(DashboardViewController.date), userInfo: nil, repeats: true)
        userLabel.text = "Bonjour, " + UserDefaults.standard.string(forKey: "utilisateur")!
        userLabel.textAlignment = NSTextAlignment.center
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "Tableau de Bord"
        navigationItem.hidesBackButton = true
        //        userLabel.text = "Bonjour, " + stringPassed
        userLabel.textAlignment = NSTextAlignment.center
    }
    
    func date(){
        let date = DateFormatter()
        date.locale = Locale(identifier: "fr_FR")
        date.dateStyle = .full
        dateLabel.text = date.string(from: Date())
        dateLabel.textAlignment = NSTextAlignment.center
    }
    
    @IBAction func lessonsDayClic(_ sender: UIButton) {
//    }
//    @IBAction func lessonsClic(sender : UIButton) {
        
        let defaults = UserDefaults.standard
        let dayLessonRead = "dayLessonRead"
        let today = Date()
        UserDefaults.standard.set(Date(), forKey: dayLessonRead)
        if let date = defaults.object(forKey: "dayLessonRead") as? Date, date == today{
            if let already = defaults.object(forKey: "alreadyRead") as? Bool, already == false{
                UserDefaults.standard.set(true, forKey: "alreadyRead")
                print("today + false")
                //On récupère Main.storyboard
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                //On crée une instance d'Exercice à partir du storyboard
                let lessons = storyboard.instantiateViewController(withIdentifier: "lessons") as! LessonsExercisesVC
                //On montre le nouveau controller
                navigationController?.show(lessons, sender: self)
            }
        }
        else{
            let alertController = UIAlertController(title: "Désolé", message: "Revenez demain pour une nouvelle leçon", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Retour", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            print ("not today +  true")
        }
    }
    
    @IBAction func calendarClic(sender : UIButton) {
        //On récupère Main.storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //On crée une instance d'Exercice à partir du storyboard
        let calendar = storyboard.instantiateViewController(withIdentifier: "calendar") as! NextDatesViewController
        //On montre le nouveau controller
        navigationController?.show(calendar, sender: self)
    }
    
    
    @IBAction func logOutButtonTapped(_ sender: UIButton) {
        UserDefaults.standard.removeObject(forKey: "username")
        UserDefaults.standard.removeObject(forKey: "motDePasse")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //On crée une instance d'Exercice à partir du storyboard
        let signIn = storyboard.instantiateViewController(withIdentifier: "signin") as! SignInViewController
        //On montre le nouveau controller
        navigationController?.show(signIn, sender: self)
        
    }
    
}
