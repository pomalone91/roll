//
//  ConsoleIO.swift
//  roll
//
//  Created by Paul Malone on 2/4/18.
//  Copyright © 2018 Paul Malone. All rights reserved.
//

import Foundation

enum OutputType {
    case error
    case standard
}

class ConsoleIO {
    
    // Prints the explanation when roll is started
    func welcomeMessage() {
        print("Welcome to Roll")
        print("Type q, quit, or exit and press enter to quit")
        print("Otherwise, enter a roll expression similar to 1d8 + 1")
    }
    
    func writeMessage(_ message: String, to: OutputType = .standard) {
        switch to {
        case .standard:
            print("\(message)", terminator:"")
        case .error:
            fputs("\(message)\n", stderr)
        }
    }
    
    // Function to get user input, unwrap it using guard-let and return the string.
    func getInput() -> String {
        guard let responseString = readLine() else { return "Invalid response" }
        return responseString
    }
    
    // Get the roll values from the userInput string
    func getValues(_ input: String) -> [Int] {
        let valueStrings =  match(for: "\\d+", in: input)
        var values: [Int] = []
        
        for value in valueStrings {
            values.append(Int(value)!)
        }
        
        return values
    }
    
    // Get symbol from input
    func getSymbol(_ input: String) -> [String] {
        return match(for: "[+|-]", in: input)
    }
    
    // Check to see if they want to quit
    func getQuitting(_ input: String) -> Bool {
        var quit = false
        var matchedValues: [String] = []
        matchedValues += match(for: "(q|quit|exit)", in: input)
        
        if matchedValues.count > 0 {
            quit = true
        }
        return quit
    }
    
    // Find a certain regular expression in a given string. Returns an array of strings matching the given expression.
    func match(for regex: String, in text: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: text, range: NSRange(text.startIndex..., in: text))
            return results.map {
                String(text[Range($0.range, in: text)!])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
    
    func rollMessage() {
        // Print the die rolled and the result
    }
}



























