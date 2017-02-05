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
        
        let defaults = UserDefaults.standard
        let dayLessonRead = "dayLessonRead"
        let today = Date()
        UserDefaults.standard.set(Date(), forKey: dayLessonRead)
        if let date = defaults.object(forKey: "dayLessonRead") as? Date, date == today{
            print("today")
            
        }
        else{
            print ("not today")
        }
        
        if Lessons.lessonsDone.contains(Lessons.allLessons[randomIndex].id){
            print("deja dans l'array")
            print(randomIndex)

        }
        
        let vcName = "exerciseDay"
//        let randomExercise = Int(arc4random_uniform(UInt32(Lessons.allLessons[randomIndex].exercises.count)))
        let vc = storyboard?.instantiateViewController(withIdentifier: vcName) as! ExerciseViewController
        vc.lesson = Lessons.allLessons[0]
        vc.questionPassed = Lessons.allLessons[0].exercises[0].question
        Lessons.lessonsDone.append(Lessons.allLessons[randomIndex].id)
        navigationController?.pushViewController(vc, animated: true)
        print(Lessons.lessonsDone)
    }

    func dashIconTouched(sender: UIBarButtonItem){
        let destinationViewController = navigationController?.storyboard?.instantiateViewController(withIdentifier: "dashboard") as? DashboardViewController
        navigationController?.pushViewController(destinationViewController!, animated: true)
    }    
}
