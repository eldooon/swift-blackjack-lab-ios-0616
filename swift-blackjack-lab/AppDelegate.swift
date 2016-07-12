//
//  AppDelegate.swift
//  swift-blackjack-lab
//
//  Created by Flatiron School on 7/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    /**
     
     * Declare any custom properties here.
     
     */
    
    let dealer : Dealer = Dealer()
    let bettingAmount : UInt = 10
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        /*
         
         * Call your custom classes here when running the scheme.
         
         */
        
        // Do not alter
        return true  //
    }   ///////////////
    
    /*
     
     * Write your playBlackjack method in here
     
     */
    
    func playBlackjack () {
        
        dealer.placeBet(bettingAmount)
        dealer.player.canPlaceBet(bettingAmount)
        dealer.deal()
    }
    
}

