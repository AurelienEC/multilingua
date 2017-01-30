//
//  ExerciseYesterdayVC.swift
//  Multilingua
//
//  Created by Oliv on 23/01/2017.
//  Copyright © 2017 Oliv. All rights reserved.
//

import UIKit

class ExerciseYesterdayVC: UIViewController{
    
    var questionPassed: String = ""
    var answerText1Passed:String = ""
    var answerText2Passed:String = ""
    var answerText3Passed:String = ""
    var answerText4Passed:String = ""
    
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
        
        self.questionLabel.text = "Question : " + questionPassed
        questionLabel.textAlignment = NSTextAlignment.center
        self.answerText1.text = answerText1Passed
        self.answerText2.text = answerText2Passed
        self.answerText3.text = answerText3Passed
        self.answerText4.text = answerText4Passed
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func awakeFromNib() {
        self.view.layoutIfNeeded()
        
        answer1.isSelected = true
        answer2.isSelected = false
        answer3.isSelected = false
        answer4.isSelected = false
    }
    
    func userDidEnterData(data:String){
        answerText1.text = data
    }
    
    func checkAnswer(sender: RadioButton){
        
    }
    
    func validateButtonTapped(sender: UIButton){
        
    }
    
    
    
}
