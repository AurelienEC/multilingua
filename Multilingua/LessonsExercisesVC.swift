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
    var answersDDay:Array = Answers.showAnswersDay()
    var questionTextContentYesterday:String = Questions.showExerciseOfYesterday()
    var answersYesterday:Array = Answers.showAnswersYesterday()
    var questionTextContentBeforeYesterday:String = Questions.showExerciseOfBeforeYesterday()
    var answersBeforeYesterday:Array = Answers.showAnswersBeforeYesterday()
    
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
            (vc as! ExerciseViewController).answerText1Passed = answersDDay[0] as! String
            (vc as! ExerciseViewController).answerText2Passed = answersDDay[1] as! String
            (vc as! ExerciseViewController).answerText3Passed = answersDDay[2] as! String
            (vc as! ExerciseViewController).answerText4Passed = answersDDay[3] as! String
        }
        else if vc is ExerciseYesterdayVC{
            (vc as! ExerciseYesterdayVC).questionPassed = questionTextContentYesterday
            (vc as! ExerciseYesterdayVC).answerText1Passed = answersYesterday[0] as! String
            (vc as! ExerciseYesterdayVC).answerText2Passed = answersYesterday[1] as! String
            (vc as! ExerciseYesterdayVC).answerText3Passed = answersYesterday[2] as! String
            (vc as! ExerciseYesterdayVC).answerText4Passed = answersYesterday[3] as! String
        }
        
        else if vc is ExerciseBeforeYesterdayVC{
            (vc as! ExerciseBeforeYesterdayVC).questionPassed = questionTextContentBeforeYesterday
            (vc as! ExerciseBeforeYesterdayVC).answerText1Passed = answersBeforeYesterday[0] as! String
            (vc as! ExerciseBeforeYesterdayVC).answerText2Passed = answersBeforeYesterday[1] as! String
            (vc as! ExerciseBeforeYesterdayVC).answerText3Passed = answersBeforeYesterday[2] as! String
            (vc as! ExerciseBeforeYesterdayVC).answerText4Passed = answersBeforeYesterday[3] as! String
        }

        navigationController?.pushViewController(vc!, animated: true)
    }
    
    func dashIconTouched(sender: UIBarButtonItem){
        let destinationViewController = navigationController?.storyboard?.instantiateViewController(withIdentifier: "dashboard") as? DashboardViewController
        navigationController?.pushViewController(destinationViewController!, animated: true)
    }    
}
