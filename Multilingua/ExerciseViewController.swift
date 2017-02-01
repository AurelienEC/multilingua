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
    var selectedAnswer: String?
    var pointsCounter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answer1?.alternateButton = [answer2!, answer3!, answer4!]
        answer2?.alternateButton = [answer1!, answer3!, answer4!]
        answer3?.alternateButton = [answer1!, answer2!, answer4!]
        answer4?.alternateButton = [answer1!, answer2!, answer3!]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesBackButton = true // pour bloquer le retour en arrière
        validateButton.layer.cornerRadius = 5
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
                print("Answer1 selected")
                if answerText1.text == lesson.exercises[0].expectedAnswer.value{
                    print("bonne réponse")
                    selectedAnswer = "GA"
            }
        case answer2:
                print("Answer2 Selected")
                if answerText2.text == lesson.exercises[0].expectedAnswer.value{
                    print("bonne réponse")
                    selectedAnswer = "GA"
            }
        case answer3:
                print("Answer3 Selected")
                if answerText3.text == lesson.exercises[0].expectedAnswer.value{
                    print("bonne réponse")
                    selectedAnswer = "GA"
            }
        case answer4:
                print("Answer4 Selected")
                if answerText4.text == lesson.exercises[0].expectedAnswer.value{
                    print("bonne réponse")
                    selectedAnswer = "GA"
            }
        default:
            let alertController = UIAlertController(title: "Attention", message: "Merci de faire un choix.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Fermer", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
    
        }
    }

    @IBAction func validateButtonTapped(_ sender: Any) {
        if selectedAnswer == "GA"{
            pointsCounter += 1
            let alertController = UIAlertController(title: "Bravo", message: "Bonne réponse", preferredStyle: .alert)
            let vcName = "secondExerciseDay"
            let vc = storyboard?.instantiateViewController(withIdentifier: vcName) as! SecondExerciseVC
            vc.lesson = Lessons.allLessons[1]
            vc.questionPassed = Lessons.allLessons[1].exercises[0].question
            vc.pointsCounter = pointsCounter
            let defaultAction = UIAlertAction(title: "Suite", style: .default, handler: { action in self.navigationController?.pushViewController(vc, animated: true)})
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            print("Compteur de point actuel à\(pointsCounter)")
        }
        else
        {
            let alertController = UIAlertController(title: "Aïe", message: "Mauvaise réponse", preferredStyle: .alert)
            let vcName = "secondExerciseDay"
            let vc = storyboard?.instantiateViewController(withIdentifier: vcName) as! SecondExerciseVC
            vc.lesson = Lessons.allLessons[1]
            vc.questionPassed = Lessons.allLessons[1].exercises[0].question
            vc.pointsCounter = pointsCounter
            let defaultAction = UIAlertAction(title: "Suite", style: .default, handler: { action in self.navigationController?.pushViewController(vc, animated: true)})
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
        }

    }
}
