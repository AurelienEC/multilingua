//
//  ExerciseViewController.swift
//  Multilingua
//
//  Created by Oliv on 23/01/2017.
//  Copyright © 2017 Oliv. All rights reserved.
//

import UIKit

class ExerciseViewController: UIViewController{
    
    var lesson:Lesson!
    
    var questionPassed: String = ""
//    var answerText1Passed:String = ""
//    var answerText2Passed:String = ""
//    var answerText3Passed:String = ""
//    var answerText4Passed:String = ""
//    
    var answersTextPassed:Array = [""]
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answer1: RadioButton!
    @IBOutlet weak var answer2: RadioButton!
    @IBOutlet weak var answer3: RadioButton!
    @IBOutlet weak var answer4: RadioButton!
    
    @IBOutlet weak var answerText1: UILabel!
    @IBOutlet weak var answerText2: UILabel!
    @IBOutlet weak var answerText3: UILabel!
    @IBOutlet weak var answerText4: UILabel!
    
    @IBOutlet weak var validateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answer1?.alternateButton = [answer2!, answer3!, answer4!]
        answer2?.alternateButton = [answer1!, answer3!, answer4!]
        answer3?.alternateButton = [answer1!, answer2!, answer4!]
        answer4?.alternateButton = [answer1!, answer2!, answer3!]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.questionLabel.text = "Question : " + questionPassed
        questionLabel.textAlignment = NSTextAlignment.center
        self.answerText1.text = lesson.exercises[0].answers[0].value
        self.answerText2.text = lesson.exercises[0].answers[1].value
        self.answerText3.text = lesson.exercises[0].answers[2].value
        self.answerText4.text = lesson.exercises[0].answers[3].value
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.view.layoutIfNeeded()
        answer1.isSelected = true
        answer2.isSelected = false
        answer3.isSelected = false
        answer4.isSelected = false
    }
    
    @IBAction func checkAnswer(_ sender: RadioButton) {
        
        switch sender{
        case answer1:
                print("Answer1 is selected")
//            let answerUser = answer
            
        case answer2:
                print("Answer2 Selected")
            
        case answer3:
                print("Answer3 Selected")
            
        case answer4:
                print("Answer4 Selected")
        default:
                print("Another answer is selected")
    
        }
    }
    
    func validateButtonTapped(sender: UIButton){
    
    }
    
//    func getLesson() -> Lesson{
//        
//    }
}
