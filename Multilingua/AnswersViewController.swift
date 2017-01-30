//
//  AnswersViewController.swift
//  Multilingua
//
//  Created by Oliv on 26/01/2017.
//  Copyright © 2017 Oliv. All rights reserved.
//

import UIKit

class AnswersViewController: UIViewController{
    
//    let lesson:Lesson! = nil
    var pointsCounter:Int = 0
    
    @IBOutlet weak var answerText: UITextView!
    
    @IBOutlet weak var backToDashboardButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesBackButton = true // pour bloquer le retour en arrière
        answerText.text = "Vous avez obtenu\(pointsCounter) points"
    }
    @IBAction func backToDashboard(_ sender: UIButton) {
        let destinationViewController = navigationController?.storyboard?.instantiateViewController(withIdentifier: "dashboard") as? DashboardViewController
        navigationController?.pushViewController(destinationViewController!, animated: true)
    }
}
