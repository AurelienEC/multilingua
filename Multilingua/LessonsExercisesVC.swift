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
    @IBOutlet weak var lessonTextContent: UITextView!
    var questionTextContentDay:String = Questions.showExerciseOfToday()
    var questionTextContentYesterday:String = Questions.showExerciseOfYesterday()
    var questionTextContentBeforeYesterday:String = Questions.showExerciseOfBeforeYesterday()
    
    var arrayOfNames = [String]()
    
    var segueIdentifier:String? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        goToExercise.layer.cornerRadius = 5
        arrayOfNames = ["exerciseDay","exerciseYesterday","exerciseBeforeYesterday"]
        lessonTextContent.text = Lessons.showLessonOfToday()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_dashboard"), style: .plain, target: self, action: #selector(dashIconTouched))

    }
    
    
    @IBAction func goToExercise(_ sender: UIButton) {
        let numberOfNames = UInt32(arrayOfNames.count)
        let randomNumber = Int(arc4random() % numberOfNames)
        let vcName = arrayOfNames[randomNumber]
        let vc = storyboard?.instantiateViewController(withIdentifier: vcName)
        
        if vc is  ExerciseViewController{
            (vc as! ExerciseViewController).questionPassed = questionTextContentDay
            
        }
        else if vc is ExerciseYesterdayVC{
            (vc as! ExerciseYesterdayVC).questionPassed = questionTextContentYesterday
        }
        
        else if vc is ExerciseBeforeYesterdayVC{
            (vc as! ExerciseBeforeYesterdayVC).questionPassed = questionTextContentBeforeYesterday
        }

        navigationController?.pushViewController(vc!, animated: true)

    }
    
    func dashIconTouched(sender: UIBarButtonItem){
        let destinationViewController = navigationController?.storyboard?.instantiateViewController(withIdentifier: "dashboard") as? DashboardViewController
        navigationController?.pushViewController(destinationViewController!, animated: true)
    }

    
    func showLesson(_ sender: UITextView){

        
    }
    
    
}
