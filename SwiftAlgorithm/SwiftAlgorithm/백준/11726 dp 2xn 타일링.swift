//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 1/1/24.
//

import Foundation

let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: n+1)

if n == 1 {
    print(1)
} else if n == 2 {
    print(2)
} else {
    dp[1] = 1
    dp[2] = 2

    for i in 3..<n+1{
        dp[i] = (dp[i-1] + dp[i-2]) % 10007
    }
    print(dp[n])
}
