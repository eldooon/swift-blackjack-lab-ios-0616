//
//  House.swift
//  swift-blackjack-lab
//
//  Created by Eldon Chan on 7/12/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class  House : Player {
    
    override init(name: String){
        super.init(name: name)
        self.tokens = 1000
    }
    
    var mustHit : Bool {
        
        if handscore >= 17 {
            return false
        }
        
        return true
    }
}