//
//  Answers.swift
//  Multilingua
//
//  Created by Oliv on 26/01/2017.
//  Copyright © 2017 Oliv. All rights reserved.
//

import UIKit

class Answers: UIViewController, DataSentDelegate{
    
    @IBOutlet weak var answerText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func userDidEnterData(data: String) {
        answerText.text = data
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "validateAnswerSegue"{
            let exercisesVC: Exercises = segue.destination as! Exercises
            exercisesVC.delegate = self
        }
    }
}
