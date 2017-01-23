//
//  Dashboard.swift
//  Multilingua
//
//  Created by Oliv on 18/01/2017.
//  Copyright © 2017 Oliv. All rights reserved.
//

import UIKit

class Dashboard: UIViewController {
    
    var time = Timer()
    var stringPassed = ""
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(Dashboard.date), userInfo: nil, repeats: true)
        userLabel.text = stringPassed
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func date(){
        let date = DateFormatter()
        date.dateStyle = .full
        dateLabel.textAlignment = NSTextAlignment.center
    }
}
