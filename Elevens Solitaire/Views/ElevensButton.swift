//
//  ElevensButton.swift
//  Elevens Solitaire
//
//  Created by Jose Monge on 2/1/21.
//

import Foundation
import UIKit

class ElevensButton: UIButton {
    
    //constants
    
    let smallWidthMult: CGFloat = 0.25
    let mediumWidthMult: CGFloat = 0.4
    
    let heightMult: CGFloat = 0.35
    
    //methods
    
    func load(title: String) {
        
        setTitle(title, for: .normal)
        titleLabel?.font = ElevensStyle.mediumButtonFont
        titleLabel?.adjustsFontSizeToFitWidth = true
        setTitleColor(.black, for: .normal)
        backgroundColor = UIColor.white
        layer.borderWidth = 6
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = 7
    }
}
