//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 1/1/24.
//

import Foundation

let t = Int(readLine()!)!
var dp: [Int] = [Int](repeating: 0, count: 12)
dp[1] = 1
dp[2] = 2
dp[3] = 4
for i in 4..<12 {
    dp[i] = dp[i-1] + dp[i-2] + dp[i-3]
}

for _ in 0..<t {
    let input = Int(readLine()!)!
    print(dp[input])
}
