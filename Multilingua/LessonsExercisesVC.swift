//
//  LessonsExercisesVC.swift
//  Multilingua
//
//  Created by Oliv on 23/01/2017.
//  Copyright © 2017 Oliv. All rights reserved.
//

import UIKit


class LessonsExercisesVC: UIViewController{
    
    @IBOutlet weak var goToExercise: UIButton!
    @IBOutlet weak var lessonTextTitle: UILabel!
    @IBOutlet weak var lessonTextContent: UITextView!

    var segueIdentifier:String? = nil
    
    var randomIndex = Int(arc4random_uniform(UInt32(Lessons.allLessons.count)))
    
    var lessonDone = ""
    
    var allLessons = Lessons.lessonsDone.filter {$0 != Lessons.allLessons.count}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goToExercise.layer.cornerRadius = 5
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let lessonToShow = Lessons.arrayNotDoneLessons.first{ // Si le tableau des leçons non effectuées n'est pas vide on affiche une leçon dans l'ordre chronologique
            let title = lessonToShow.title
            let content = lessonToShow.content
            lessonTextTitle.text = title
            lessonTextContent.text = content
        }
        else{
            let alertController = UIAlertController(title: "Désolé", message: "Plus de leçons disponibles", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Fermer", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func goToExercise(_ sender: UIButton) {
        
        let vcName = "exerciseDay"
        let randomExercise = Int(arc4random_uniform(UInt32(Lessons.allLessons[randomIndex].exercises.count))) //Pour un exercice aléatoire
        let vc = storyboard?.instantiateViewController(withIdentifier: vcName) as! ExerciseViewController
        vc.lesson = Lessons.allLessons[randomIndex]
        vc.questionPassed = Lessons.allLessons[randomIndex].exercises[randomExercise].question
        Lessons.lessonsDone.append((Lessons.arrayNotDoneLessons.first?.id)!) // on ajoute l'id de la leçon lue à l'array LessonsDone
        navigationController?.pushViewController(vc, animated: true)
    }
}
