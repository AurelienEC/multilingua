//
//  Lessons.swift
//  Multilingua
//
//  Created by Oliv on 23/01/2017.
//  Copyright © 2017 Oliv. All rights reserved.
//

import Foundation

class Lessons{
    
    let date = Date()
    
    let lessons = ["Leçon N°1", "Leçon N°2", "Leçon N°3", "Leçon N°4", "Leçon N°5"]
    
    enum Navigation: Int {
        case vc1 = 0, vc2 = 1, vc3 = 2
        
        static let definedNavigations = 3
        
        func storyboardIdentifier() -> String{
            
            return "locationVC_\(self.rawValue + 1)"
        }
    }
}
