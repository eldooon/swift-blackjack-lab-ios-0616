//
//  Dealer.swift
//  swift-blackjack-lab
//
//  Created by Eldon Chan on 7/12/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Dealer {
    var deck : Deck = Deck()
    var house : House = House(name: "House")
    var player : House = House(name: "Player")
    var bet : UInt = 0
    
    func placeBet (bet: UInt) -> Bool {
        
        if house.tokens >= bet && player.tokens >= bet {
            self.bet = bet
            return true
        }
        
        return false
        
    }
    
    func deal () {
        
        self.house.stayed = false
        self.player.stayed = false
        
        player.cards.removeAll()
        house.cards.removeAll()
        
        let firstCard = deck.drawCard()
        player.cards.append(firstCard)
        let secondCard = deck.drawCard()
        house.cards.append(secondCard)
        let thirdCard = deck.drawCard()
        player.cards.append(thirdCard)
        let fourthCard = deck.drawCard()
        house.cards.append(fourthCard)
    }
    
    func turn (whoseTurn : House) {
        
        if house.mayHit && house.stayed == false{
            if house.mustHit{
                let newCard = deck.drawCard()
                house.cards.append(newCard)
            }
        }
        
        else if house.stayed {
            house.stayed = true
        }
        
    }

    func winner () -> String {
        if house.busted == true || player.blackjack == true || (player.handscore > house.handscore && player.stayed && house.stayed) || (player.cards.count == 5 && player.busted == false) {
            return "player"
        }
        
        else if player.busted == true || house.blackjack == true || (player.handscore <= house.handscore && player.stayed && house.stayed){
            return "house"
        }
        
        else {
            return "no"
        }
    }
    
    func award() -> String{
        
        var winnerMessage : String = ""
        
        if winner() == "player"{
            player.didWin(bet)
            house.didLose(bet)
            
            winnerMessage = "player wins"
        }
        
        else if winner() == "house"{
            house.didWin(bet)
            player.didLose(bet)
            
            winnerMessage = "house wins"
        }
        
        else {
            winnerMessage = "No winners"
        }
        
        return winnerMessage
    }
}