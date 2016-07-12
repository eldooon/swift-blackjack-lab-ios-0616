//
//  Player.swift
//  swift-blackjack-lab
//
//  Created by Eldon Chan on 7/12/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Player {
    
    var name : String
    var cards : [Card] = []
    
    var handscore : UInt {
        var defaultScore : UInt = 0
        for card in cards {
            if cards.count == 2 && card.cardLabel.containsString("A"){
                defaultScore += 11
            }
                
            else {
                defaultScore += card.cardValue
            }
        }
        
        return defaultScore
    }
    
    var blackjack : Bool {
        if handscore == 21 && cards.count == 2 {
             return true
        }
        
        return false
    }
    var busted : Bool {
        if handscore > 21 {
            return true
        }
        
        return false
    }
    
    var stayed : Bool = false
    
    var mayHit : Bool {
        if blackjack == false && busted == false {
             return true
        }
        
        return false
    }
    
    var tokens : UInt = 100
    
    var description : String {
        
        var cardsInHandDescription : String = ""
        
        for card in cards {
            cardsInHandDescription = card.description
        }
        
        return "Player Info:\nCards: \(cardsInHandDescription)\nHandscore: \(handscore)\nBlackjack: \(blackjack)\nBusted: \(busted)\nStayed: \(stayed)\nTokens:\(tokens)"
    }
    
    init (name : String) {
        self.name = name
    }
    
    func canPlaceBet (bet : UInt) -> Bool {
        if tokens >= bet {
            return true
        }
        
        return false
    }
    
    func didWin (betValue : UInt) {
        tokens += betValue
    }
    
    func didLose (betValue : UInt) {
        tokens -= betValue
    }
}