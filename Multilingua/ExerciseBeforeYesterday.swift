//
//  ExerciseBeforeYesterday.swift
//  Multilingua
//
//  Created by Oliv on 24/01/2017.
//  Copyright © 2017 Oliv. All rights reserved.
//

import UIKit

class ExerciseBeforeYesterday: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "Exercice"
        navigationItem.backBarButtonItem?.title = "Retour à la leçon"
    }
}


