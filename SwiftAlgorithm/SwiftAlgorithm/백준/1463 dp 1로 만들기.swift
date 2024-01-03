//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 1/1/24.
//

import Foundation

// 1463 1로 만들기
let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: n + 1)

for i in 2..<n + 1 {
    dp[i] = dp[i-1] + 1
    if i % 3 == 0 {
        dp[i] = min(dp[i/3] + 1, dp[i])
    }
    
    if i % 2 == 0 {
        dp[i] = min(dp[i/2] + 1, dp[i])
    }
}

print(dp[n])
