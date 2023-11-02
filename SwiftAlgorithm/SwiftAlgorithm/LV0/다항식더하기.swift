//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/02/13.
//

import Foundation

func solution(_ polynomial:String) -> String {
    let elements  = polynomial.components(separatedBy: " + ")
    let firstOrder = elements.filter { $0.contains("x") }.map { $0.components(separatedBy: "x").joined() }.compactMap { return $0 == "" ?  1 :  Int($0) }
    var firstOrderTotal = firstOrder.reduce(0, +)
    var firstOrderString: String
    if firstOrderTotal == 1 {
        firstOrderString = ""
    } else {
        firstOrderString = String(firstOrderTotal)
    }

    
    let constants = elements.filter { !$0.contains("x") }.compactMap { Int($0) }.reduce(0, +)
    if constants == 0 {
        return firstOrderString + "x"
    } else if firstOrderTotal == 0 {
        return String(constants)
    } else {
        return firstOrderString + "x" + " + \(constants)"
    }
}
print(solution("8 + 15 + x"))
