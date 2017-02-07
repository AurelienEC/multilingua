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
    var id:Int
    let title:String
    let content:String
    let exercises:[Exercise]
    
}
class Lessons{
    static var arrayNotDoneLessons = allLessons.filter { !Lessons.lessonsDone.contains($0.id) }
    static var lessonsDone = [Int]()
    static let allLessons:[Lesson] = [
        Lesson(id: 1,
            title: "Le preterit",
               content: "Pour les verbes les plus courants, qu'on appelle verbes réguliers, il suffit d'ajouter -ED au verbe pour le mettre au prétérit",exercises:[
                Exercise(question: "Quel est la terminaison du préterit ?",
                         answers:
                    [
                        Answer(value: "-ing"),
                        Answer(value: "-ong"),
                        Answer(value: "-ed"),
                        Answer(value: "-oing")
                    ],
                         expectedAnswer: Answer(value: "-ed"))
            ]
        )
        ,
        Lesson(id: 2,
            title: "Le Present Perfect",
               content: "Il s'emploie pour parler d'actions ou de situations qui ont commencé et fini dans un passé récent mais ont un rapport avec le moment présent.",
               exercises:[
            Exercise(question: "Quand utiliser le present Perfect",
                     answers:
                [
                Answer(value: "Une action passée"),
                Answer(value: "Une action future"),
                Answer(value: "Une action récente relative au moment présent"),
                Answer(value: "Le présent")
                ],
                     expectedAnswer: Answer(value: "Une action récente relative au moment présent"))
            ])
        ,
        Lesson(id: 3,
               title: "Les adjectifs", content: "Tous les adjectifs d’une syllabe sont des adjectifs courts. (Ex : nice / cool / old / tall).", exercises:[
            Exercise(question: "Comment sont composés les adjectifs courts ?", answers: [
                Answer(value: "D'une syllabe"),Answer(value: "De deux syllabes"),Answer(value: "De trois syllabes"),Answer(value: "De quatre syllabes")
                ], expectedAnswer: Answer(value: "D'une syllabe"))
            ])
        ,
        Lesson(id: 4,
               title: "Le Past Perfect", content: "On utilise l'auxiliaire AVOIR au passé « HAD » à toutes les personnes et l'on y ajoute le participe passé du verbe concerné. (Participe passé = Base verbale + ed ou 3e colonne des verbes irréguliers à connaître par cœur) ", exercises:[
            Exercise(question: "Quel est l'auxiliaire à utiliser pour le Past Perfect", answers: [
                Answer(value: "BE"),Answer(value: "GET"),Answer(value: "HAVE"),Answer(value: "Aucun")
                ], expectedAnswer: Answer(value: "HAVE"))
            ])
        ,
        Lesson(id: 5,
               title: "For et le Present Perfect", content: "Le present perfect indique que l'action a commencé dans le passé et qu'elle a un lien avec le présent. For nous indique qu'elle se continue dans le présent ou qu'elle dure. ", exercises:[
                Exercise(question: "Qu'utilise-t-on avec For ?", answers: [
                    Answer(value: "Le Present Perfect"),Answer(value: "Le présent"),Answer(value: "Le Passé Antérieur"),Answer(value: "Le futur")
                    ], expectedAnswer: Answer(value: "Le Present Perfect"))
            ])
        ,
        Lesson(id: 6,
               title: "Verbes Irréguliers", content: "Les verbe irréguliers disposent de conjugaisons spécifiques - Reportez vous au tableau.", exercises:[
                Exercise(question: "Quelle est la forme correcte du preterit pour ce verbe irrégulier - Forget?", answers: [
                    Answer(value: "Forgate"),Answer(value: "Forgotten"),Answer(value: "Forgit"),Answer(value: "Forgot")
                    ], expectedAnswer: Answer(value: "Forgot"))
            ])
        ,
        Lesson(id: 7,
               title: "Le Ago", content: "' Ago ' est un petit mot qui sert à exprimer le temps qui s'est écoulé depuis une action passée", exercises:[
                Exercise(question: "Ago permet d'exprimer un(e) ...", answers: [
                    Answer(value: "temps"),Answer(value: "moment"),Answer(value: "distance"),Answer(value: "verbe")
                    ], expectedAnswer: Answer(value: "temps"))
            ])
        ,
        Lesson(id: 8,
               title: "Emploi du prétérit", content: "Principal emploi: action passée et terminée, datée soit par le contexte, soit par l'énonciateur (celui qui parle)", exercises:[
                Exercise(question: "Quelle type d'action désigne le préterit ? Une action ...", answers: [
                    Answer(value: "présente"),Answer(value: "passée"),Answer(value: "future"),Answer(value: "proche")
                    ], expectedAnswer: Answer(value: "passée"))
            ])
        ,
    ]
    
}
