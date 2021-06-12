//
//  StatusView.swift
//  Elevens Solitaire
//
//  Created by Jose Monge on 2/1/21.
//

import Foundation
import UIKit

class StatusView: UIView {
    
    //properties
    
    let deckImage = UIImageView()
    let firstLabel = UILabel()
    let secondLabel = UILabel()
    let thirdLabel = UILabel()
    
    let spacing: CGFloat = 15
    
    //methods
    
    func load() {
        
        backgroundColor = .clear
        
        //deckImage
        addSubview(deckImage)
        deckImage.translatesAutoresizingMaskIntoConstraints = false
        
        deckImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: spacing).isActive = true
        deckImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        deckImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7).isActive = true
        deckImage.widthAnchor.constraint(equalTo: deckImage.heightAnchor, multiplier: 0.72).isActive = true
        
        //firstLabel
        firstLabel.textColor = .white
        addSubview(firstLabel)
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        
        firstLabel.leftAnchor.constraint(equalTo: deckImage.rightAnchor, constant: spacing).isActive = true
        firstLabel.topAnchor.constraint(equalTo: deckImage.topAnchor, constant: 20).isActive = true
        
        //secondLabel
        secondLabel.textColor = .white
        addSubview(secondLabel)
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        
        secondLabel.leftAnchor.constraint(equalTo: firstLabel.leftAnchor).isActive = true
        secondLabel.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: spacing).isActive = true
        
        //thirdLabel
        thirdLabel.textColor = .white
        addSubview(thirdLabel)
        thirdLabel.translatesAutoresizingMaskIntoConstraints = false
        
        thirdLabel.leftAnchor.constraint(equalTo: firstLabel.leftAnchor).isActive = true
        thirdLabel.topAnchor.constraint(equalTo: secondLabel.bottomAnchor, constant: spacing).isActive = true
    }
    
    func setDeckImage(to image: UIImage?) {
        
        if image == nil { return }
        
        deckImage.image = image!
    }
    
    func updateLabelText(label: Int, text: String) {
        
        switch label {
        case 0:
            firstLabel.text = text
            break
        case 1:
            secondLabel.text = text
            break
        case 2:
            thirdLabel.text = text
            break
        default:
            break
        }
    }
    
    func updateLabelFont(label: Int, font: UIFont?) {
        
        if font == nil { return }
        
        switch label {
        case 0:
            firstLabel.font = font!
            break
        case 1:
            secondLabel.font = font!
            break
        case 2:
            thirdLabel.font = font!
            break
        default:
            break
        }
    }
}
