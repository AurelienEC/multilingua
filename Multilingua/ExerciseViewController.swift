//
//  ExerciseViewController.swift
//  Multilingua
//
//  Created by Oliv on 23/01/2017.
//  Copyright © 2017 Oliv. All rights reserved.
//

import UIKit

class ExerciseViewController: UIViewController, UIGestureRecognizerDelegate{

    typealias OnNext = (Bool) -> Void
//    var lesson:Lesson!
    var exercise:Exercise!
    var onNext: OnNext!
    
//    var questionPassed: String = ""
    
//    var answersTextPassed:Array = [""]
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet var answerTexts: [UILabel]!
    
    @IBOutlet var answers: [RadioButton]!
    
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
    var exercisesDones: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answer1?.alternateButton = [answer2!, answer3!, answer4!]
        answer2?.alternateButton = [answer1!, answer3!, answer4!]
        answer3?.alternateButton = [answer1!, answer2!, answer4!]
        answer4?.alternateButton = [answer1!, answer2!, answer3!]
        
        for answerText in answerTexts { // on enable l'interaction pour le tap Gesture
            answerText.isUserInteractionEnabled = true
        }
        let tapOne = UITapGestureRecognizer(target: self, action: #selector(ExerciseViewController.answerTapped))
        answerText1.addGestureRecognizer(tapOne)
        let tapTwo = UITapGestureRecognizer(target: self, action: #selector(ExerciseViewController.answerTapped))
        answerText2.addGestureRecognizer(tapTwo)
        let tapThree = UITapGestureRecognizer(target: self, action: #selector(ExerciseViewController.answerTapped))
        answerText3.addGestureRecognizer(tapThree)
        let tapFour = UITapGestureRecognizer(target: self, action: #selector(ExerciseViewController.answerTapped))
        answerText4.addGestureRecognizer(tapFour)
        
        exercisesDones += 1
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesBackButton = true // pour bloquer le retour en arrière
        validateButton.layer.cornerRadius = 5
        self.questionLabel.text = "Question : " + exercise.question
        questionLabel.textAlignment = NSTextAlignment.center
        self.answerText1.text = exercise.answers[0].value
        self.answerText2.text = exercise.answers[1].value
        self.answerText3.text = exercise.answers[2].value
        self.answerText4.text = exercise.answers[3].value
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.view.layoutIfNeeded()
        for answer in answers{
            answer.isSelected = false
            break
        }
    }
    
    func answerTapped(sender: UITapGestureRecognizer){
        for (index,answerText) in answerTexts.enumerated(){
            if sender.view == answerText{
                answers[index].isSelected = true
                let filteredAnswers = answers.filter { $0 != answers[index]}
                for filteredAnswer in filteredAnswers{
                    filteredAnswer.isSelected = false
                }
                checkAnswer(answers[index])
            }
        }
    }
    
    @IBAction func checkAnswer(_ sender: RadioButton) {
        switch sender{
        case answer1:
            if answerText1.text == exercise.expectedAnswer.value{
                selectedAnswer = "GA"
            }
            else{
                selectedAnswer = "BA"
            }
        case answer2:
            if answerText2.text == exercise.expectedAnswer.value{
                selectedAnswer = "GA"
            }
            else{
                selectedAnswer = "BA"
            }
        case answer3:
            if answerText3.text == exercise.expectedAnswer.value{
                selectedAnswer = "GA"
            }
            else{
                selectedAnswer = "BA"
            }
        case answer4:
            if answerText4.text == exercise.expectedAnswer.value{
                selectedAnswer = "GA"
            }
            else{
                selectedAnswer = "BA"
            }
        default:
            selectedAnswer = "error"
        }
    }
    
//    func presentAlert(title: String, message: String, actionTitles: [String]){
//        
//    }
//    
    @IBAction func validateButtonTapped(_ sender: Any) {

        if ((selectedAnswer) != nil){
            if selectedAnswer == "GA"{
                pointsCounter += 1
                let alertController = UIAlertController(title: "Bravo", message: "Bonne réponse", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "Suite", style: .default, handler: { action in self.onNext(true)})
                alertController.addAction(defaultAction)
                present(alertController, animated: true, completion: nil)
            }
            else
            {
                let alertController = UIAlertController(title: "Oups!", message: "Mauvaise réponse", preferredStyle: .alert)
                let vcName = "secondExerciseDay"
                let vc = storyboard?.instantiateViewController(withIdentifier: vcName) as! SecondExerciseVC
                vc.lesson = Lessons.arrayNotDoneLessons.first
                vc.questionPassed = (Lessons.arrayNotDoneLessons.first?.exercises[0].question)!
                vc.pointsCounter = pointsCounter
                vc.exercisesDone = exercisesDones
                let defaultAction = UIAlertAction(title: "Suite", style: .default, handler: { action in self.navigationController?.pushViewController(vc, animated: true)})
                alertController.addAction(defaultAction)
                present(alertController, animated: true, completion: nil)
            }
        }
        else
        {
            let alertController = UIAlertController(title: "Attention", message: "Merci de faire un choix.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Fermer", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
        }
    }
}
