//
//  Card.swift
//  swift-blackjack-lab
//
//  Created by Eldon Chan on 7/11/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Card {
    
    var suit : String
    var rank : String
    var cardLabel : String
    var cardValue : UInt
    
    init (suit : String, rank : String){
        
        self.suit = suit
        self.rank = rank
        self.cardLabel = "\(suit)\(rank)"
        
        var value :UInt
        
        if self.rank == "A" {
            value = 1
        }
        
        else if self.rank == "J" {
            value = 10
        }
            
        else if self.rank == "Q" {
            value = 10
        }
            
        else if self.rank == "K" {
            value = 10
        }
        
        else {
            value = UInt(self.rank)!
        }
        
        self.cardValue = value
        
    }
    
    var description : String {
        return cardLabel
    }
    
    class func validSuit () -> [String] {
        
        return ["♠","♥","♣","♦"]
        
    }
    
    class func validRank () -> [String] {
        
        return ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"];
        
    }
}
