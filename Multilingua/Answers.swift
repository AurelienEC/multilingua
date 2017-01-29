//
//  Answers.swift
//  Multilingua
//
//  Created by Oliv on 27/01/2017.
//  Copyright © 2017 Oliv. All rights reserved.
//

import Foundation

class Answers{
    
    // liste des bonnes réponses
    let expectedAnswerDDay:String = "Yes it's true"
    let expectedAnswerYesterday:String = "went there."
    let expectedAnswerBeforeYesterday:String = "was too big."
    
    // liste des réponses
    let answersDDay:Array = ["Yes it's true", "was too big.", "is too big.", "have too big." ]
    let answersYesterday:Array = ["were broken.", "was too big.", "went there.", "have too big." ]
    let answersBeforeYesterday:Array = ["were broken.", "was too big.", "is too big.", "have too big." ]
    
    static func showAnswersDay() -> String {
//        let expectedAnswerDDay:String = "Yes it's true"
        let answersDDay:Array = ["Yes it's true", "was too big.", "is too big.", "have too big." ]
        
        for answer in answersDDay{
            return answersDDay[i]
        }
        
    }
}
