//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/01/11.
//

import Foundation

func solution(_ my_string:String) -> Int {
    return my_string.components(separatedBy: CharacterSet.decimalDigits.inverted).compactMap { Int($0) }.reduce(0, +)
}

solution("aAb1B2cC34oOp")
