//
//  Calculator.swift
//  calc
//
//  Created by Jacktator on 31/3/20.
//  Copyright © 2020 UTS. All rights reserved.
//

import Foundation

enum Op: String {
    case add = "+"
    case sub = "-"
    case mul = "x"
    case div = "/"
    case mod = "%"

    func apply(lhs: Int, rhs: Int) -> Int? {
        switch self {
        case .add: return lhs + rhs
        case .sub: return lhs - rhs
        case .mul: return lhs * rhs
        case .div: return rhs != 0 ? lhs / rhs : nil
        case .mod: return rhs != 0 ? lhs % rhs : nil
        }
    }
}

class ExpressionEvaluator {
    var elements: [String]

    init(_ elements: [String]) {
        self.elements = elements
    }

    func evaluate() -> Int? {
        guard elements.count >= 3, elements.count % 2 == 1 else { return nil }

        while elements.count > 1 {
            guard let lhs = Int(elements[0]),
                  let op = Op(rawValue: elements[1]),
                  let rhs = Int(elements[2]),
                  let result = op.apply(lhs: lhs, rhs: rhs),
                  result >= Int32.min, result <= Int32.max else {
                return nil
            }

            elements.replaceSubrange(0...2, with: [String(result)])
        }

        return Int(elements[0])
    }
}

class Calculator {
    func calculate(args: [String]) -> String {
        let evaluator = ExpressionEvaluator(args)
        guard let result = evaluator.evaluate() else {
            fputs("Error: Invalid input or overflow\n", stderr)
            exit(1)
        }
        return String(result)
    }
}
