//
//  Users.swift
//  Multilingua
//
//  Created by Oliv on 18/01/2017.
//  Copyright © 2017 Oliv. All rights reserved.
//

import UIKit

class Users: UIViewController {
    
    
    func userData(){
    
    let defaults = UserDefaults.standard
    let users = ["Jean","Phil","Alex","Brian"]
    let pass = ["1234","1234","1234","1234"]
        
    defaults.set(users, forKey: "Usernames")
    defaults.set(pass, forKey: "Passwords")


    }
}
