//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/01/01.
//

import Foundation

func mySolution(_ array:[Int]) -> [Int] {
    return [array.max()!, array.firstIndex(of: array.max()!)!]
}

func solution1(_ array:[Int]) -> [Int] {
    let max = array.enumerated().max(by: { $0.element < $1.element })!
    return [max.element, max.offset]
}

