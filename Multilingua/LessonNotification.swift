//
//  LessonNotification.swift
//  Multilingua
//
//  Created by Oliv on 31/01/2017.
//  Copyright © 2017 Oliv. All rights reserved.
//

import Foundation
import UserNotifications

enum LessonKind {
    case anglais
    case espagnol
    case portuguais
}

struct LessonNotifications {
    static public let triggerHourDifference = -1
    
    let kind: LessonKind
    let date: Date
    let calendar: Calendar
    
    init(kind: LessonKind, date: Date, calendar: Calendar = Calendar.autoupdatingCurrent) {
        self.kind = kind
        self.date = date
        self.calendar = calendar
    }
    
    var text: String {
        let formatter = DateFormatter()
        formatter.calendar = self.calendar
        formatter.locale = Locale(identifier: "fr_FR")
        formatter.dateFormat = "EEEE dd MMMM yyyy 'à' H:mm"
        
        let dateText = formatter.string(from: self.date)
        let lessonText: String = {
            switch self.kind {
            case .anglais: return "Anglais"
            case .espagnol: return "Espagnol"
            case .portuguais: return "Portugais"
            }
        }()
        
        return "\(lessonText): \(dateText)"
    }

}


let calendar = Calendar.autoupdatingCurrent
