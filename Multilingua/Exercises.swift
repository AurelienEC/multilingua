//
//  Exercises.swift
//  Multilingua
//
//  Created by Oliv on 23/01/2017.
//  Copyright © 2017 Oliv. All rights reserved.
//

import UIKit

protocol DataSentDelegate {
    func userDidEnterData(data: String)
}

class Exercises: UIViewController{
    
    var delegate: DataSentDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // liste des exercices
    let exerciceTitle:String = "Indiquez la bonne réponse parmi les choix proposés"
    let exerciceDDay:String = "Those clouds are very dark "
    let exerciceYesterday:String = "He looks as if he "
    let exerciceBeforeYesterday:String = "When I went to the car park, I found that my car "
    
    // liste des bonnes réponses
    let reponseDDay:String = "Yes it's true"
    let reponseYesterday:String = "went there."
    let reponseBeforeYesterday:String = "was too big."
    
    // liste des réponses
    let answersDDay:Array = ["Yes it's true", "was too big.", "is too big.", "have too big." ]
    let answersYesterday:Array = ["were broken.", "was too big.", "went there.", "have too big." ]
    let answersBeforeYesterday:Array = ["were broken.", "was too big.", "is too big.", "have too big." ]
    
//    func displayConsigne() -> String {
//        return exerciceTitle
//    }
//    
//    func displayExercise() -> String {
//        return exerciceDDay
//    }
//    
//    func displayAnswerList() -> String {
//
//    }
    @IBAction func displayAnswer(_sender: AnyObject?){
        let data = String(describing: answersDDay)
        delegate?.userDidEnterData(data: data)
    }
}
