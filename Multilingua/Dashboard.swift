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


    
//    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    var stringPassed = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(Dashboard.dateAndTime), userInfo: nil, repeats: true)
        userLabel.text = stringPassed
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func dateAndTime(){
//        let time = DateFormatter()
        let date = DateFormatter()
        
//        time.timeStyle = .long
        date.dateStyle = .full
        
//        timeLabel.text = time.string(from: Date())
//        timeLabel.center = self.view.center
//        timeLabel.textAlignment = NSTextAlignment.center
        dateLabel.text = date.string(from: Date())
//        dateLabel.center = self.view.center
        dateLabel.textAlignment = NSTextAlignment.center
        
    }
    
    func getUser(){

    }

}

