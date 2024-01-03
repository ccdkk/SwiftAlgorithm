//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/17/23.
//

import Foundation


func solution(_ word:String) -> Int {
    let alphabet = ["A", "E", "I", "O", "U"]
    let words = word.map { String($0) }
    let initial = words.count
    let multipleValue: [Int] = [781, 156, 31, 6, 1]
    var ans = 0
    
    for (i, word) in words.enumerated() {
        ans += multipleValue[i] * alphabet.firstIndex(of: word)!
    }
    ans += initial
    return ans
}

