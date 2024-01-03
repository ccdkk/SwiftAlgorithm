//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 1/1/24.
//

import Foundation

let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: n + 1)
// 내 값이 어디에서 온 것인지를 따로 저장한 후 경로를 복원
var pre = [Int](repeating: 0, count: n + 1)
dp[1] = 0
for i in 2..<n + 1 {
    dp[i] = dp[i-1] + 1
    pre[i] = i-1
    if i % 3 == 0 {
        if (dp[i/3] + 1) < dp[i] {
            pre[i] = i / 3
        }
        dp[i] = min(dp[i/3] + 1, dp[i])
        
    }
    
    if i % 2 == 0 {
        if (dp[i/2] + 1) < dp[i] {
            pre[i] = i / 2
        }
        dp[i] = min(dp[i/2] + 1, dp[i])
    }
}
print(dp[n])
var index = n
while index != 0 {
    print(index, terminator: " ")
    index = pre[index]
}
