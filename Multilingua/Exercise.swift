//
//  Exercise.swift
//  Multilingua
//
//  Created by Oliv on 23/01/2017.
//  Copyright © 2017 Oliv. All rights reserved.
//

import UIKit

class Exercise: UIViewController, DataSentDelegate{
    
    @IBOutlet weak var consigneLabel: UILabel!
    
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
        consigneLabel.text = "Indiquez la bonne réponse parmi les choix proposés"
        answer1?.alternateButton = [answer2!, answer3!, answer4!]
        answer2?.alternateButton = [answer1!, answer3!, answer4!]
        answer3?.alternateButton = [answer1!, answer2!, answer4!]
        answer4?.alternateButton = [answer1!, answer2!, answer3!]
                
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
