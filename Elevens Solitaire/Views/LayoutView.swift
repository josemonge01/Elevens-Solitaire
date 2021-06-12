//
//  LayoutView.swift
//  Elevens Solitaire
//
//  Created by Jose Monge on 2/1/21.
//

import Foundation
import UIKit

class LayoutView: UIView {
    
    //properties
    
    var cards = [UIButton]()
    var delegate: LayoutViewDelegate?
    
    //methods
    
    func load() {
        
        if delegate == nil {return}
        
        backgroundColor = UIColor.clear
        let spacing: CGFloat = 15
        
        for i in 0..<9 {
            
            let card = UIButton()
            card.setImage(delegate!.getCardImage(at: i), for: .normal)
            card.layer.borderColor = UIColor.blue.cgColor
            card.layer.cornerRadius = 5
            card.tag = i
            card.addTarget(self, action: #selector(cardSelected(_:)), for: .touchUpInside)
            cards.append(card)
            addSubview(card)
            card.translatesAutoresizingMaskIntoConstraints = false
            
            card.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.28).isActive = true
            card.widthAnchor.constraint(equalTo: card.heightAnchor, multiplier: 0.7).isActive = true
            
            //x anchor
            
            if i % 3 == 0 {
                card.leftAnchor.constraint(equalTo: self.leftAnchor, constant: spacing).isActive = true
            }
            else if i % 3 == 1 {
                card.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            }
            else {
                card.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -1 * spacing).isActive = true
            }
            
            //y anchor
            
            if i < 3 {
                card.topAnchor.constraint(equalTo: self.topAnchor, constant: spacing).isActive = true
            }
            else if i < 6 {
                card.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            }
            else {
                card.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -1 * spacing).isActive = true
            }
        }
    }
    
    func updateLayout(at selection: (Int?, Int?)) {
        
        if selection.0 == nil || selection.1 == nil {return}
        if delegate == nil {return}
        
        cards[selection.0!].setImage(delegate!.getCardImage(at: selection.0!), for: .normal)
        cards[selection.1!].setImage(delegate!.getCardImage(at: selection.1!), for: .normal)
    }
    
    func updateLayout() {
        
        if delegate == nil {return}
        
        for i in 0..<9 {
            
            cards[i].setImage(delegate!.getCardImage(at: i), for: .normal)
            unhighlightCard(at: i)
        }
    }
    
    func highlightCard(at index: Int) {
        
        cards[index].layer.borderWidth = 10
    }
    
    func unhighlightCard(at index: Int) {
        
        cards[index].layer.borderWidth = 0
    }
    
    //actions
    
    @objc func cardSelected(_ sender: UIButton) {
        
        delegate?.cardSelected(at: sender.tag)
    }
}



protocol LayoutViewDelegate {
    
    func getCardImage(at index: Int) -> UIImage?
    func cardSelected(at index: Int)
}
