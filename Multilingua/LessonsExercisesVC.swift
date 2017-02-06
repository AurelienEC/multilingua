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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goToExercise.layer.cornerRadius = 5     
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let allLessons = Lessons.allLessons
        let randomIndex = Int(arc4random_uniform(UInt32(allLessons.count)))
        let randomTitle = allLessons[randomIndex].title
        let randomContent = allLessons[randomIndex].content
        lessonTextTitle.text = randomTitle
        lessonTextContent.text = randomContent
    }
    
    @IBAction func goToExercise(_ sender: UIButton) {
        
        let vcName = "exerciseDay"
//        let randomExercise = Int(arc4random_uniform(UInt32(Lessons.allLessons[randomIndex].exercises.count))) Pour un exercice aléatoire
        let vc = storyboard?.instantiateViewController(withIdentifier: vcName) as! ExerciseViewController
        vc.lesson = Lessons.allLessons[0]
        vc.questionPassed = Lessons.allLessons[0].exercises[0].question
        Lessons.lessonsDone.append(Lessons.allLessons[randomIndex].id)
        navigationController?.pushViewController(vc, animated: true)
        print(Lessons.lessonsDone)
    }
}
