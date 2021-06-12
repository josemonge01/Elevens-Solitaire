//
//  ArcadeGame.swift
//  Elevens Solitaire
//
//  Created by Jose Monge on 2/1/21.
//

import Foundation

class ArcadeGame {
    
    //properties
    
    var layout: [Card?]
    let maxCards = 9
    
    //methods
    
    init() {
        
        layout = [Card?](repeating: nil, count: maxCards)
        replaceCards()
    }
    
    func newGame() {
        
        layout.removeAll()
        layout = [Card?](repeating: nil, count: maxCards)
        replaceCards()
    }
    
    func replaceCards() {
        
        let randIndex1 = Int.random(in: 0..<maxCards)
        var randIndex2 = Int.random(in: 0..<maxCards)
        while (randIndex1 == randIndex2) {
            randIndex2 = Int.random(in: 0..<maxCards)
        }
        
        if layout[randIndex1] == nil && layout[randIndex2] == nil {
            
            let randValue = Int.random(in: 0...11)
            layout[randIndex1] = makeCard(with: randValue)
            let otherValue = randValue == 11 ? 11 : 11 - randValue
            layout[randIndex2] = makeCard(with: otherValue)
        }
        else if layout[randIndex1] == nil {
            
            let value = layout[randIndex2]!.value
            let otherValue = value == 11 ? 11 : 11 - value
            layout[randIndex1] = makeCard(with: otherValue)
        }
        else if layout[randIndex2] == nil {
            
            let value = layout[randIndex1]!.value
            let otherValue = value == 11 ? 11 : 11 - value
            layout[randIndex2] = makeCard(with: otherValue)
        }
        else {
            
            for i in 0..<maxCards {
                if layout[i] == nil {
                    randIndex2 = i
                    break
                }
            }
            let value = layout[randIndex1]!.value
            let otherValue = value == 11 ? 11 : 11 - value
            layout[randIndex2] = makeCard(with: otherValue)
        }
        
        for i in 0..<maxCards {
            
            if layout[i] == nil {
                
                layout[i] = makeCard(with: Int.random(in: 1...11))
            }
        }
    }
    
    func makeCard(with value: Int) -> Card {
        
        var rank = ""
        let faceRanks = ["jack", "queen", "king"]
        
        switch value {
        
        case 1:
            rank = "ace"
            break
        case 11:
            rank = faceRanks[Int.random(in: 0..<3)]
            break
        default:
            rank = "\(value)"
            break
        }
        
        return Card(rank, "spades", value)
    }
    
    func removeCards(at selection: (Int?, Int?)) {
        
        if selection.0 == nil || selection.1 == nil {
            return
        }
        
        layout[selection.0!] = nil
        layout[selection.1!] = nil
    }
    
    func moveIsLegal(_ selection: (Int?, Int?)) -> Bool{
        
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
}
