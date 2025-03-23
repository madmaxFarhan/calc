//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

let args = CommandLine.arguments.dropFirst()

// Show usage if no input
if args.isEmpty {
    print("Usage: ./calc <expression>")
    print("Example: ./calc 3 + 5 x 2 - 1")
    exit(1)
}

// Create calculator and evaluate input
let calc = Calculator()
let result = calc.calculate(args: Array(args))
print(result)
