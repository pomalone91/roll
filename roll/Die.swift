//
//  Die.swift
//  DiceRoller
//
//  Created by Paul Malone on 8/12/17.
//  Copyright © 2017 stroggi. All rights reserved.
//

import Foundation

/*** Structure defining components of dice, such as the total number of dice to be rolled.
 *** The type of dice to be rolled and the modifier added to the sum of the rolls ***/
struct Die {
    var sides: UInt32 = 4
    var totalDice: Int = 1
    var modifier: Int = 0
    
    /*** Add or remove 1 dice when button is tapped
     *** If the number of die exceeds the maximum of 99, it resets to 1
     *** If the total number of die is 1 and one is subtracted, it resets to the max, 99,
     ***/
//    mutating func addDie() {
//        self.totalDice += 1
//        print(self.totalDice)
//        if totalDice > 99 {
//            totalDice = 1
//        }
//    }
//    mutating func removeDie() {
//        self.totalDice -= 1
//        if totalDice < 1 {
//            totalDice = 99
//        }
//        print(self.totalDice)
//    }
    
//    //  Add or subtract 1 from the modifier value to the roll
//    mutating func addModifier() {
//        self.modifier += 1
//        if modifier > 99 {
//            self.modifier = -99
//        }
//        print("modifier is: \(self.modifier)")
//    }
//    mutating func removeModifier() {
//        self.modifier -= 1
//        if modifier < -99 {
//            self.modifier = 99
//        }
//        print("modifier is: \(self.modifier)")
//    }
    
//    // Function to reset modifiers and total dice
//    mutating func resetDie() {
//        self.modifier = 0
//        self.totalDice = 1
//    }
    
    
    //  Function to handle rolling the dice
    func rollDie() -> Int {
//        print("Rolled \(totalDice)d\(sides) \(modifier)")
        
        //  Use upperBound determined from switch statement to set the max possible value created using arc4random_uniform()
        var rollValue = UInt32()
        var i = totalDice
        while i > 0 {
            rollValue += arc4random_uniform(sides)
            i -= 1
        }
        return Int((rollValue)) + 1 + modifier
    }
}


