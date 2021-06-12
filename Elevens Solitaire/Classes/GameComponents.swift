//
//  GameComponents.swift
//  Elevens Solitaire
//
//  Created by Jose Monge on 2/1/21.
//

import Foundation

class Card {
    
    //properties
    
    let rank: String
    let suit: String
    let value: Int
    
    //methods
    
    init(_ rank: String, _ suit: String, _ value: Int) {
        
        self.rank = rank
        self.suit = suit
        self.value = value
    }
}



class Deck {
    
    //properties
    
    var cards: [Card]
    var size = 0
    
    let ranks = ["ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "jack", "queen", "king"]
    let suits = ["spades", "hearts", "clubs", "diamonds"]
    let values = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 11, 11]
    
    //mehtods
    
    init() {
        
        cards = [Card]()
        
        for i in 0..<suits.count {
            for j in 0..<ranks.count {
                let card = Card(ranks[j], suits[i], values[j])
                cards.append(card)
            }
        }
        size = cards.count
    }
    
    func reset() {
        
        shuffle()
        size = cards.count
    }
    
    func shuffle() {
        
        for current in 0..<cards.count {
            
            let random = Int.random(in: 0..<cards.count)
            let temp = cards[random]
            cards[random] = cards[current]
            cards[current] = temp
        }
    }
    
    func draw() -> Card? {
        
        if size == 0 {
            return nil
        }
        
        size -= 1
        return cards[size]
    }
}
