//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/3/23.
//

import Foundation

let N = Int(readLine()!)!
var AB: [[Int]] = []

for _ in 0..<N {
    AB.append(readLine()!.split(separator: " ").map { Int($0)! })
}
AB.sort { $0[0] < $1[0]}

let B = AB.map { $0[1] }
var dp: [Int] = Array(repeating: 1, count: N)

for (i, n) in B.enumerated() {
    for j in 0..<i {
        if n > B[j] {
            dp[i] = max(dp[j] + 1, dp[i])
        }
    }
}

print(N - dp.max()!)
