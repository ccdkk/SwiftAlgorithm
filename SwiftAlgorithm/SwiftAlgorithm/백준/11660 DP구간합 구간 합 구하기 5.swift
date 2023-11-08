//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/8/23.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let M = input[1]
var nums: [[Int]] = [Array(repeating: 0, count: N+1)]

for _ in 0..<N {
    nums.append([0] + readLine()!.split(separator: " ").map { Int($0)! })
}

var dp = nums

// dp를 적용하여 시간초과를 막아야 한다.
for i in 1...N {
    for j in 1...N {
        dp[i][j] = dp[i][j] + dp[i][j-1] + dp[i-1][j] - dp[i-1][j-1]
    }
}


for _ in 0..<M {
    let range = readLine()!.split(separator: " ").map { Int($0)! }
    let (x1, y1, x2, y2) = (range[0], range[1], range[2], range[3])
    let ans = dp[x2][y2] - dp[x2][y1-1] - dp[x1-1][y2] + dp[x1-1][y1-1]
    print(ans)
}

