//
//  Users.swift
//  Multilingua
//
//  Created by Oliv on 23/01/2017.
//  Copyright © 2017 Oliv. All rights reserved.
//

import Foundation

class Users{
    private enum Keys {
        static let username = "utilisateur"
        static let password = "motDePasse"
    }
    static func login(username: String?, password: String?) -> Bool{
        
        let usersAndPasses = ["Jean":"1234","Phil":"1234","Alex":"1234","Brian":"1234"]
        
        if let user = username
            , let pass = password
            , pass == usersAndPasses[user]{
            
            // Connection OK
            UserDefaults.standard.set(user, forKey: Keys.username)
            UserDefaults.standard.set(pass, forKey: Keys.password)
            return true
        }
        return false
    }
}
