//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/1/23.
//

import Foundation

let N = Int(readLine()!)!
var dp: [Int] = [Int](repeating: 0, count: N+1)

for idx in 2..<N + 1 {
    dp[idx] = dp[idx - 1] + 1
    if idx % 3 == 0 {
        dp[idx] = min(dp[idx / 3] + 1, dp[idx])
    }
    if idx % 2 == 0 {
        dp[idx] = min(dp[idx], dp[idx / 2] + 1)
    }
}
// 2...N으로 했을 때 런타임 에러가 뜨는데 왜일까?
for idx in 2...N {
    dp[idx] = dp[idx - 1] + 1
    if idx % 3 == 0 {
        dp[idx] = min(dp[idx / 3] + 1, dp[idx])
    }
    if idx % 2 == 0 {
        dp[idx] = min(dp[idx], dp[idx / 2] + 1)
    }
}

for idx in 2...N {
    print(idx)
}

print(dp[N])
