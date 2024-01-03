//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/10/23.
//

import Foundation

let strings1: [String] = [""] + Array(readLine()!.map { String($0)})
let strings2: [String] = [""] + Array(readLine()!.map { String($0)})
var dp = Array(repeating: Array(repeating: 0, count: strings2.count),count: strings1.count)

for i in 0..<strings1.count {
    for j in 0..<strings2.count {
        if i == 0 || j == 0 {
            dp[i][j] = 0
        } else {
            if strings1[i] == strings2[j] {
                dp[i][j] = dp[i-1][j-1] + 1
            } else {
                dp[i][j] = max(dp[i-1][j], dp[i][j-1])
            }
        }
    }
}

print(dp[strings1.count - 1][strings2.count - 1])


