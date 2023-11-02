//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/2/23.
//

import Foundation

let N = Int(readLine()!)!
var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: 10), count: 101)
var ans = 0

for i in 1...9 {
    dp[1][i] = 1
}

for i in 0...9 {
    if i == 0 || i == 9 || i == 1 {
        dp[2][i] = 1
    } else {
        dp[2][i] = 2
    }
}

// 각 단계에서 1000000000으로 나누기 전에는 런타임 에러가 떴지만 나누고 난 뒤에는 뜨지 않음
if N >= 3 {
    for i in 3..<N + 1 {
        for j in 0...9 {
            if j == 0 {
                dp[i][j] = dp[i-1][1] % 1000000000
            } else if j == 9 {
                dp[i][j] = dp[i-1][8] % 1000000000
            } else {
                dp[i][j] = (dp[i-1][j-1] + dp[i-1][j+1]) % 1000000000
            }
        }
    }
}
print(dp[N].reduce(0) {$0 + $1} % 1000000000)
