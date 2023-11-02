//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/07/13.
//

import Foundation

func solution(_ s:String) -> Bool {
    if s.count == 4 || s.count == 6 {
        let arr = s.components(separatedBy: CharacterSet.decimalDigits).compactMap { $0 == "" ? nil : $0 }
        if arr.isEmpty {
            return true
        } else {
            return false
        }
    } else {
        return false
    }
}

// 좋은 풀이

func solution2(_ s:String) -> Bool {
    switch s.count {
    case 4, 6:
        break
    default:
        return false
    }
    
    if let num = Int(s) {
        return true
    } else {
        return false
    }
}

func solutionGPT(_ s: String) -> Bool {
    if s.count == 4 || s.count == 6 {
        let numbers = CharacterSet.decimalDigits
        let range = s.rangeOfCharacter(from: numbers.inverted)
        print(s.rangeOfCharacter(from: numbers.inverted))
        print(s[range!])
        return s.rangeOfCharacter(from: numbers.inverted) == nil
    }
    return false
}


