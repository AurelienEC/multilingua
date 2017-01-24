//
//  LessonsExercises.swift
//  Multilingua
//
//  Created by Oliv on 23/01/2017.
//  Copyright © 2017 Oliv. All rights reserved.
//

import UIKit

class LessonsExercises: UIViewController{
    
    @IBOutlet weak var goToExercise: UIButton!
    var arrayOfNames = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        goToExercise.layer.cornerRadius = 5
        arrayOfNames = ["exerciseDay","exerciseYesterday","exerciseBeforeYesterday"]
        
    }
    override func viewDidAppear(_ animated: Bool) {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_dashboard"), style: .plain, target: self, action: #selector(dashIconTouched))

    }
    
    @IBAction func goToExercise(_ sender: UIButton) {
        let numberOfNames = UInt32(arrayOfNames.count)
        let randomNumber = Int(arc4random() % numberOfNames)
        let vcName = arrayOfNames[randomNumber]
        
        let vc = storyboard?.instantiateViewController(withIdentifier: vcName)
        self.present(vc!, animated: true, completion: nil)
    }
    
    func dashIconTouched(sender: UIBarButtonItem){
        let destinationViewController = navigationController?.storyboard?.instantiateViewController(withIdentifier: "dashboard") as? Dashboard
        navigationController?.pushViewController(destinationViewController!, animated: true)
    }

    
    
}
