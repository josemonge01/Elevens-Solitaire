//
//  ElevensStyle.swift
//  Elevens Solitaire
//
//  Created by Jose Monge on 2/1/21.
//

import Foundation
import UIKit

class ElevensStyle {
    
    static let titleFont = UIFont(name: "Arial-BoldMT", size: 44)
    static let subtitleFont = UIFont(name: "Arial-BoldMT", size: 28)
    static let standardFont = UIFont(name: "ArialMT", size: 22)
    static let smallFont = UIFont(name: "ArialMT", size: 18)
    static let mediumButtonFont = UIFont(name: "Arial-BoldMT", size: 18)
    
    static let Deck = [
        0: "deck_0",
        1: "deck_1",
        2: "deck_2",
        3: "deck_3",
        4: "deck_4"
    ]
    
    static let Color = [
        0: UIColor(red: 25.0/255.0, green: 83.0/255.0, blue: 30.0/255.0, alpha: 1),
        1: UIColor(red: 155.0/255.0, green: 43.0/255.0, blue: 43.0/255.0, alpha: 1),
        2: UIColor(red: 140.0/255.0, green: 140.0/255.0, blue: 140.0/255.0, alpha: 1),
        3: UIColor(red: 175.0/255.0, green: 95.0/255.0, blue: 153.0/255.0, alpha: 1),
        4: UIColor(red: 67.0/255.0, green: 98.0/255.0, blue: 124.0/255.0, alpha: 1)
    ]
}
