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
    case english
    case spanish
    case portuguese
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
            case .english: return "Anglais"
            case .spanish: return "Espagnol"
            case .portuguese: return "Portugais"
            }
        }()
        
        return "\(lessonText): \(dateText)"
    }
    
    /*var trigger: UNCalendarNotificationTrigger {
        let triggerDate = self.calendar.date(byAdding: .hour, value: LessonNotifications.triggerHourDifference, to: self.date) ?? self.date
        let components = self.calendar.dateComponents([.year, .month, .day, .hour, .minute], from: triggerDate)
        
        return UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
    }*/
}


let calendar = Calendar.autoupdatingCurrent
/*let notification = LessonNotifications(kind: .english, date: calendar.date(from: DateComponents(year: 2017, month: 12, day: 30, hour: 15, minute: 30))!)

let formations: [LessonNotifications] = [
    LessonNotifications(kind: .spanish, date: calendar.date(from: DateComponents(year: 2017, month: 12, day: 30, hour: 15, minute: 30))!),
    LessonNotifications(kind: .english, date: calendar.date(from: DateComponents(year: 2017, month: 12, day: 30, hour: 15, minute: 30))!),
    LessonNotifications(kind: .english, date: calendar.date(from: DateComponents(year: 2017, month: 12, day: 30, hour: 15, minute: 30))!)
]*/
