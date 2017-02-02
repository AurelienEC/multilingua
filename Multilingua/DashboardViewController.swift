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
    
    @IBAction func lessonsClic(sender : UIButton) {
        //On récupère Main.storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //On crée une instance d'Exercice à partir du storyboard
        let lessons = storyboard.instantiateViewController(withIdentifier: "lessons") as! LessonsExercisesVC
        //On montre le nouveau controller
        navigationController?.show(lessons, sender: self)
        
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
