//
//  AnswersViewController.swift
//  Multilingua
//
//  Created by Oliv on 26/01/2017.
//  Copyright © 2017 Oliv. All rights reserved.
//

import UIKit

class AnswersViewController: UIViewController{
    
    @IBOutlet weak var answerText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func userDidEnterData(data: String) {
        answerText.text = data
    }
    

}
