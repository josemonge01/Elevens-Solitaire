//
//  ClassicGame.swift
//  Elevens Solitaire
//
//  Created by Jose Monge on 2/1/21.
//

import Foundation


class ClassicGame {
    
    //properties
    
    var layout: [Card?]
    let maxCards = 9
    let deck: Deck
    
    //methods
    
    init() {
        
        layout = [Card?](repeating: nil, count: maxCards)
        deck = Deck()
        deck.shuffle()
        replaceCards()
    }
    
    func newGame() {
        
        deck.reset()
        layout.removeAll()
        layout = [Card?](repeating: nil, count: maxCards)
        replaceCards()
    }
    
    func replaceCards() {
        
        for i in 0..<maxCards {
            
            if layout[i] == nil {
                layout[i] = deck.draw()
            }
        }
    }
    
    func removeCards(at selection: (Int?, Int?)) {
        
        if selection.0 == nil || selection.1 == nil {
            return
        }
        
        layout[selection.0!] = nil
        layout[selection.1!] = nil
    }
    
    func moveIsLegal(_ selection: (Int?, Int?)) -> Bool {
        
        if selection.0 == nil || selection.1 == nil {
            return false
        }
        
        let value1 = layout[selection.0!]?.value ?? -1
        let value2 = layout[selection.1!]?.value ?? -1
        let testsum = value1 + value2
        
        if testsum == 11 || testsum == 22 {
            return true
        }
        return false
    }
    
    func moveIsPossible() -> Bool{
        
        for i in 0..<(maxCards - 1) {
            
            let value1 = layout[i]?.value ?? -1
            for j in (i+1)..<maxCards {
                let value2 = layout[j]?.value ?? -1
                
                let testsum = value1 + value2
                if testsum == 11 || testsum == 22 {
                    return true
                }
            }
        }
        return false
    }
    
    func deckIsEmpty() -> Bool {
        
        return deck.size == 0
    }
    
    func layoutIsEmpty() -> Bool {
        
        for i in 0..<maxCards {
            if layout[i] != nil {
                return false
            }
        }
        return true
    }
}
