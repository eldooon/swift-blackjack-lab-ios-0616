//
//  Deck.swift
//  swift-blackjack-lab
//
//  Created by Eldon Chan on 7/11/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation


class Deck {
    
    var remainingCards : [Card]
    var dealtCards : [Card]
    
    init (){
        
        self.remainingCards = []
        self.dealtCards = []
        
        for suit in Card.validSuit(){
            for rank in Card.validRank() {
                let newCard = Card(suit: suit, rank: rank)
                self.remainingCards.append(newCard)
            }
        }
        
        
    }
    
    var description : String {
        get {
            let remainingCardsDescription = remainingCards.count
            let dealtCardsDescription = dealtCards.count
            
            return "Cards Remaining: \(remainingCardsDescription)\nCards Dealt: \(dealtCardsDescription)"
            
        }
    }
    
    func drawCard() -> Card{
        
        let nextCard = remainingCards.removeAtIndex(0)
        dealtCards.append(nextCard)
        return nextCard
    }
    
    func shuffle() {
        
        remainingCards.appendContentsOf(dealtCards)
        dealtCards.removeAll()
        var copyDeck:[Card] = []
        
        while remainingCards.count > 0 {
            
            let randomIndex = arc4random_uniform(UInt32(remainingCards.count))
            copyDeck.append(remainingCards[Int(randomIndex)])
            remainingCards.removeAtIndex(Int(randomIndex))
        }
        
        remainingCards = copyDeck
    }
    
}
