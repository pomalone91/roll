//
//  main.swift
//  roll
//
//  Created by Paul Malone on 1/28/18.
//  Copyright © 2018 Paul Malone. All rights reserved.
//

import Foundation

let roll = Roll()

if CommandLine.argc > 1 {
    roll.staticMode()
} else {
    roll.interactiveMode()
}
