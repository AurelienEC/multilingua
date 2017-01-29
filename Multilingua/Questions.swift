//
//  Questions.swift
//  Multilingua
//
//  Created by Oliv on 23/01/2017.
//  Copyright © 2017 Oliv. All rights reserved.
//

import Foundation

class Questions{
    
    // liste des exercices
    let exerciceTitle:String = "Indiquez la bonne réponse parmi les choix proposés"
    let exerciceDDay:String = "Those clouds are very dark "
    let exerciceYesterday:String = "He looks as if he "
    let exerciceBeforeYesterday:String = "When I went to the car park, I found that my car "
    
    
    static func showExerciseOfToday() -> String{
        
//        let exerciceTitle:String = "Indiquez la bonne réponse parmi les choix proposés"
        let exerciceDDay:String = "Those clouds are very dark "
        
        return exerciceDDay
    }
    
    static func showExerciseOfYesterday() -> String{
        
//        let exerciceTitle:String = "Indiquez la bonne réponse parmi les choix proposés"
        let exerciceYesterday:String = "He looks as if he "

        return exerciceYesterday
    }

    static func showExerciseOfBeforeYesterday() -> String{
        
//        let exerciceTitle:String = "Indiquez la bonne réponse parmi les choix proposés"
        let exerciceBeforeYesterday:String = "When I went to the car park, I found that my car "
        
        return exerciceBeforeYesterday
    }


}
