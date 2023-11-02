//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/09/01.
//

import Foundation

// MARK: 의상

func solution(_ clothes:[[String]]) -> Int {
    var clothesDict: [String: Int] = [:]
    for clothe in clothes {
        if clothesDict[clothe[1]] != nil {
            clothesDict[clothe[1]]! += 1
        } else {
            clothesDict[clothe[1]] = 1
        }
    }
    var ans = 1
    for (_, value) in clothesDict {
        ans *= (value + 1)
    }
    
    return ans - 1
}

print(solution([["yellow_hat", "headgear"], ["blue_sunglasses", "eyewear"], ["green_turban", "headgear"]]))



