//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 1/1/24.
//

import Foundation

let n = Int(readLine()!)!
var houses: [[Int]] = []
var dp = [[Int]](repeating: [Int](repeating: 0, count: 3), count: n+1)

for _ in 0..<n {
    houses.append(readLine()!.split(separator: " ").map { Int($0)! })
}
dp[1][0] = houses[0][0]
dp[1][1] = houses[0][1]
dp[1][2] = houses[0][2]

for i in 1..<n + 1 {
    dp[i][0] = min(dp[i-1][1], dp[i-1][2]) + houses[i-1][0]
    dp[i][1] = min(dp[i-1][0], dp[i-1][2]) + houses[i-1][1]
    dp[i][2] = min(dp[i-1][0], dp[i-1][1]) + houses[i-1][2]
}

print(min(dp[n][0], dp[n][1], dp[n][2]))
