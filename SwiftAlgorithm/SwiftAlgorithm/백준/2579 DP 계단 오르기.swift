//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/1/23.
//

import Foundation

let num = Int(readLine()!)!
let scores = (1...num).map { _ in Int(readLine()!)!}
var dp: [Int] = (1...num).map { Int($0) }

if num == 1 {
    print(scores[0])
} else if num == 2 {
    print(scores[0] + scores[1])
} else if num == 3{
    print(max(scores[0] + scores[2], scores[1] + scores[2]))
} else {
    dp[0] = scores[0]
    dp[1] = scores[0] + scores[1]
    dp[2] = max(scores[0] + scores[2], scores[1] + scores[2])
    
    for idx in 3...num - 1 {
        dp[idx] = max(dp[idx - 2] + scores[idx], dp[idx - 3] + scores[idx - 1] + scores[idx])
    }
    print(dp[num - 1])
}

