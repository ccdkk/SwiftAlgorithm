//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/9/23.
//

import Foundation

let NK = readLine()!.split(separator: " ").map { Int($0)! }
let N = NK[0]
var K = NK[1]
var coins: [Int] = []
var ans = 0
for _ in 0..<N {
    coins.insert(Int(readLine()!)!, at: 0)
}

for coin in coins {
    ans += K / coin
    K %= coin
    
    if K == 0 {
        break
    }
}

print(ans)
