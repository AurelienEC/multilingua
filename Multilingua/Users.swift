//
//  Users.swift
//  Multilingua
//
//  Created by Oliv on 23/01/2017.
//  Copyright © 2017 Oliv. All rights reserved.
//

import Foundation

struct ConnectedUser {
    static private let lessonRead = "lessonRead"
    
    let username:String
    
    func didReadDayLesson(){
        UserDefaults.standard.set(Date(), forKey: ConnectedUser.lessonRead)
    }
    
    var hasReadTodaysLesson:Bool {
        
        let defaults = UserDefaults.standard
        guard let dateOfRead = defaults.object(forKey: ConnectedUser.lessonRead) as? Date else { return false }
        return Calendar.current.isDateInToday(dateOfRead)
    }
}

class Users{
    private enum Keys {
        static let username = "utilisateur"
        static let password = "motDePasse"
    }
    static func login(username: String?, password: String?) -> ConnectedUser?{
        
        let usersAndPasses = ["Jean":"1234","Phil":"1234","Alex":"1234","Brian":"1234"]
        
        if let user = username
            , let pass = password
            , pass == usersAndPasses[user]{
            
            // Connection OK
            UserDefaults.standard.set(user, forKey: Keys.username)
            UserDefaults.standard.set(pass, forKey: Keys.password)
            // On rajoute une valeur concernant l'initalisation de la lecture de la leçon du jour
            let alreadyRead = "alreadyRead"
            UserDefaults.standard.set(false, forKey: alreadyRead)
            return ConnectedUser(username: user)
        }
        return nil
    }
    
    static func getConnectedUser() -> ConnectedUser{
        return ConnectedUser(username: UserDefaults.standard.string(forKey: Keys.username) ?? "" ) // ?? "" au cas ou c'est nil c'est à droite des ??
    }
}
