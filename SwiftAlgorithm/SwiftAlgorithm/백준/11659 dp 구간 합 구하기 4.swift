//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 1/1/24.
//

import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var dp = [Int](repeating: 0, count: n+1)
let nums = [0] + readLine()!.split(separator: " ").map { Int($0)! }

dp[1] = nums[1]

for i in 2..<n+1 {
    dp[i] = dp[i-1] + nums[i]
}

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    print(dp[input[1]] - dp[input[0]-1])
}
