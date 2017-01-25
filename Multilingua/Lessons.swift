//
//  Lessons.swift
//  Multilingua
//
//  Created by Oliv on 23/01/2017.
//  Copyright © 2017 Oliv. All rights reserved.
//

import Foundation

class Lessons{
    
    static func showLessonOfToday() -> String{
//        let date = Date()
        let addDay:Int = 0
        let userCalendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.timeZone = TimeZone(abbreviation: "GMT")
//        var today = userCalendar.date(byAdding: .day, value: 0, to: Date())
        
        var dateArray:Array = [""]
        
        for i in stride(from: addDay, to: 366, by: 1){
            let today = userCalendar.date(byAdding: .day, value: i, to: Date())
            
            dateArray.append(String(describing: today))
//            print(today as Any)
        }
        
        let lessons = [dateArray[0]:"Le preterit : Pour les verbes les plus courants, qu'on appelle verbes réguliers, il suffit d'ajouter -ED au verbe pour le mettre au prétérit",
                       dateArray[1]:"Le present Pefect : Il s'emploie pour parler d'actions ou de situations qui ont commencé et fini dans un passé récent mais ont un rapport avec le moment présent.",
                       dateArray[2]:"Les adjectifs : Tous les adjectifs d’une syllabe sont des adjectifs courts. (Ex : nice / cool / old / tall)",
                       dateArray[3]:"Les comparatifs : Il existe 3 comparatifs : le comparatif de supériorité,  d'égalité, et enfin  d'infériorité"
        ]
        return lessons[String(dateArray[0])]!
    }
}
