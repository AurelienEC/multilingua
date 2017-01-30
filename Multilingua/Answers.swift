//
//  Answers.swift
//  Multilingua
//
//  Created by Oliv on 27/01/2017.
//  Copyright © 2017 Oliv. All rights reserved.
//

import Foundation

class Answers{
    
    //Retourne la liste des réponses de l'exercice du jour ...
    static func showAnswersDay() -> Array<Any> {
        let answersDDay:Array = ["Yes it's true", "was too big.", "is too big.", "have too big." ]
        return answersDDay
    }
    // ... de l'exercice d'hier...
    static func showAnswersYesterday() -> Array<Any> {
        let answersYesterday:Array = ["were broken.", "was too big.", "went there.", "have too big." ]
        return answersYesterday
    }
    //...puis de l'exercice d'avant-hier
    static func showAnswersBeforeYesterday() -> Array<Any> {
        let answersBeforeYesterday:Array = ["were broken.", "was too big.", "is too big.", "have too big." ]
        return answersBeforeYesterday
    }
    //retourne la réponse attendue de l'exercice du jour...
    static func getExpectedAnswerDDay() -> String {
        let expectedAnswerDDay:String = "Yes it's true"
        return expectedAnswerDDay
    }
    //... puis celle de l'exercice d'hier ...
    static func getExpectedAnswerYesterday() -> String {
        let expectedAnswerYesterday:String = "went there."
        return expectedAnswerYesterday
    }
    //... puis celle de l'exercice d'avant-hier
    static func getExpectedAnswerBeforeYesterday() -> String {
        let expectedAnswerBeforeYesterday:String = "was too big."
        return expectedAnswerBeforeYesterday
    }
}
