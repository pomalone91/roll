//
//  Roll.swift
//  roll
//
//  Created by Paul Malone on 2/4/18.
//  Copyright © 2018 Paul Malone. All rights reserved.
//

import Foundation
class Roll {
    
    var numberOfDie = 0
    var valueOfDie = 0
    var modifier = 0
    var quitting = false
    
    let console = ConsoleIO()
    
    func interactiveMode() {
        
        console.welcomeMessage()
        console.writeMessage("roll: ")
        while  !quitting {
            // Get input from user
            let userInput = console.getInput()
            
            // Figure out if they want to quit, and if they do, leave the loop
            quitting = console.getQuitting(userInput)
            if quitting {
                break
            }
            
            // Figure out the values for the roll
            let rollValues = console.getValues(userInput)
//            print("rollValues \(rollValues)")
            if rollValues.count < 2 {
                print("Not enough data for a roll, bye!")
                break
            } else if rollValues.count > 2 {
                numberOfDie = rollValues[0]
                valueOfDie = rollValues[1]
                modifier = rollValues[2]
            } else {
                numberOfDie = rollValues[0]
                valueOfDie = rollValues[1]
                modifier = 0
            }
            
            // Figure out if the modifier is positive or negative
            let rollSymbol = console.getSymbol(userInput)
//            print("rollSymbol \(rollSymbol)")
            if rollSymbol.count > 0 {
                if rollSymbol[0] == "-" {
                    modifier = -modifier
                }
            }
            
            let dieToRoll = Die(sides: UInt32(valueOfDie), totalDice: numberOfDie, modifier: modifier)
            print(dieToRoll.rollDie())
            
        }
    }
    
    func staticMode() {
        // Get arguments
        let argument = CommandLine.arguments[1]
        print(argument)
        let rollValues = console.getValues(argument)
        if rollValues.count < 2 {
            print("Not enough data for a roll, bye!")
        } else if rollValues.count > 2 {
            numberOfDie = rollValues[0]
            valueOfDie = rollValues[1]
            modifier = rollValues[2]
        } else {
            numberOfDie = rollValues[0]
            valueOfDie = rollValues[1]
        }
        
        // Figure out if the modifier is positive or negative
        let rollSymbol = console.getSymbol(argument)
        //            print("rollSymbol \(rollSymbol)")
        if rollSymbol.count > 0 {
            if rollSymbol[0] == "-" {
                modifier = -modifier
            }
        }
        
        let dieToRoll = Die(sides: UInt32(valueOfDie), totalDice: numberOfDie, modifier: modifier)
        print(dieToRoll.rollDie())
    }
}
