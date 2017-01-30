//
//  Lessons.swift
//  Multilingua
//
//  Created by Oliv on 23/01/2017.
//  Copyright © 2017 Oliv. All rights reserved.
//

import Foundation

struct Exercise{
    let question:String
    let answers:[Answer]
    let expectedAnswer:Answer
    
}
struct Answer{
    let value:String
    
}
struct Lesson{
    let title:String
    let content:String
    let exercises:[Exercise]
    
}
class Lessons{
    
//    static func showLessonOfToday() -> String{
//                let date = Date()
//        let addDay:Int = 0
//        let userCalendar = Calendar.current
//        var dateComponents = DateComponents()
//        dateComponents.timeZone = TimeZone(abbreviation: "GMT")
//        var today = userCalendar.date(byAdding: .day, value: 0, to: Date())
//        
//        var dateArray:Array = [""]
//        
//        for i in stride(from: addDay, to: 366, by: 1){
//            let today = userCalendar.date(byAdding: .day, value: i, to: Date())
//            
//            dateArray.append(String(describing: today))
//            print(today as Any)
//        }

    
    static let allLessons:[Lesson] = [
        Lesson(title: "Le preterit", content: "Pour les verbes les plus courants, qu'on appelle verbes réguliers, il suffit d'ajouter -ED au verbe pour le mettre au prétérit", exercises:[
            Exercise(question: "Quel est la terminaison du préterit ?", answers: [
                Answer(value: "-ing"),Answer(value: "-ong"),Answer(value: "-ed"),Answer(value: "-oing")
                ], expectedAnswer: Answer(value: "-ed"))
            ])
        ,
        Lesson(title: "Le Present Perfect", content: "Il s'emploie pour parler d'actions ou de situations qui ont commencé et fini dans un passé récent mais ont un rapport avec le moment présent.", exercises:[
            Exercise(question: "Quand utiliser le present Perfect", answers: [
                Answer(value: "Une action passée"),Answer(value: "Une action future"),Answer(value: "Une action récente relative au moment présent"),Answer(value: "Le présent")
                ], expectedAnswer: Answer(value: "Une action récente relative au moment présent"))
            ])
        ,
        Lesson(title: "Les adjectifs", content: "Tous les adjectifs d’une syllabe sont des adjectifs courts. (Ex : nice / cool / old / tall).", exercises:[
            Exercise(question: "Comment sont composés les adjectifs courts ?", answers: [
                Answer(value: "D'une syllabe"),Answer(value: "De deux syllabes"),Answer(value: "De trois syllabes"),Answer(value: "De quatre syllabes")
                ], expectedAnswer: Answer(value: "D'une syllabe"))
            ])
        ,
        Lesson(title: "Les comparatifs", content: "Il existe 3 comparatifs : le comparatif de supériorité,  d'égalité, et enfin  d'infériorité.", exercises:[
            Exercise(question: "Lequel de ces comparatifs n'existe pas ? Le comparatif de ...", answers: [
                Answer(value: "supériorité"),Answer(value: "de superlativité"),Answer(value: "d'infériorité"),Answer(value: "d'égalité")
                ], expectedAnswer: Answer(value: "de superlativité"))
            ])
    ]
    
}
