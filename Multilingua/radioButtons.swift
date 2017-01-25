//
//  radioButtons.swift
//  Multilingua
//
//  Created by Oliv on 25/01/2017.
//  Copyright © 2017 Oliv. All rights reserved.
//
import UIKit

class RadioButton: UIButton {
    var alternateButton:Array<RadioButton>?
    
    let checkedImage = UIImage(named: "ic_radio_button_checked")! as UIImage
    let uncheckedImage = UIImage(named: "ic_radio_button_unchecked")! as UIImage
    
    override func awakeFromNib() {
//        self.layer.cornerRadius = 5
//        self.layer.borderWidth = 2.0
        self.layer.masksToBounds = true
    }
    
    func unselectAlternateButtons(){
        if alternateButton != nil {
            self.isSelected = true
            
            for aButton:RadioButton in alternateButton! {
                aButton.isSelected = false
            }
        }else{
            toggleButton()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        unselectAlternateButtons()
        super.touchesBegan(touches, with: event)
    }
    
    func toggleButton(){
        self.isSelected = !isSelected
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.setImage(checkedImage, for: .normal)
            } else {
                self.setImage(uncheckedImage, for: .normal)
            }
        }
    }
}
