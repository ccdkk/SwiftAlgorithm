//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/2/23.
//

import Foundation

let n = Int(readLine()!)!
var nums: [Int] = Array(repeating: 0, count: n + 1)
var dp: [Int] = Array(repeating: 0, count: n+1)

for i in 1...n {
    nums[i] = Int(readLine()!)!
}

dp[1] = nums[1]

if n > 1 {
    dp[2] = nums[1] + nums[2]
}

if n > 2 {
    for i in 3...n {
        dp[i] = max(
            dp[i - 2] + nums[i],
            dp[i - 3] + nums[i] + nums[i-1],
            dp[i - 1]
        )
    }
}

print(dp[n])
