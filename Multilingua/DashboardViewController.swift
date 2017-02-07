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
        date() // pour éviter l'affichage du texte du label 1s avant
        time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(DashboardViewController.date), userInfo: nil, repeats: true)
        userLabel.text = "Bonjour, " + Users.getConnectedUser.username
        userLabel.textAlignment = NSTextAlignment.center
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "Tableau de Bord"
        navigationItem.hidesBackButton = true
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
        let connectedUser = Users.getConnectedUser
        if connectedUser.hasReadTodaysLesson == false{ // si la leçon du jour n'a pas encore été lue ce jour
                UserDefaults.standard.set(true, forKey: "alreadyRead")
                print("la leçon du jour n'a pas encore été lue ce jour")
                //On récupère Main.storyboard
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                //On crée une instance d'Exercice à partir du storyboard
                let lessons = storyboard.instantiateViewController(withIdentifier: "lessons") as! LessonsExercisesVC
                //On montre le nouveau controller
                navigationController?.show(lessons, sender: self)

        }
        else{
            let alertController = UIAlertController(title: "Désolé", message: "Revenez demain pour une nouvelle leçon", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Retour", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            print ("Leçon du jour déjà lue")
            print("voici le tableau des leçons effectuées \(UserDefaults.standard.array(forKey: "lessonsDone"))")
        }
    }
    
    @IBAction func calendarClic(sender : UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil) //On récupère Main.storyboard
        //On crée une instance d'Exercice à partir du storyboard
        let calendar = storyboard.instantiateViewController(withIdentifier: "calendar") as! NextDatesViewController
        navigationController?.show(calendar, sender: self) //On montre le nouveau controller
    }
    
    
    @IBAction func logOutButtonTapped(_ sender: UIButton) {
        UserDefaults.standard.removeObject(forKey: "username")
        UserDefaults.standard.removeObject(forKey: "motDePasse")
        UserDefaults.standard.removeObject(forKey: "lessonRead") // Pour supprimer la leçon lue (Test uniquement)
        UserDefaults.standard.removeObject(forKey: "lessonsDone") // Pour supprimer le tableau de leçons lues (Test uniquement)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //On crée une instance d'Exercice à partir du storyboard
        let signIn = storyboard.instantiateViewController(withIdentifier: "signin") as! SignInViewController
        //On montre le nouveau controller
        signIn.navigationItem.hidesBackButton = true
        navigationController?.show(signIn, sender: self)
        
    }
    
}
