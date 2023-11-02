//
//  m먀ㅜ.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/1/23.
//

import Foundation

var cache: [Int] = Array(repeating: 1, count: 100)

func P(_ n: Int) -> Int {
    if n == 0 || n == 1 || n == 2 {
        return 1
    }
    
    for i in 3...n {
        cache.insert(cache[i - 2] + cache[i - 3], at: i)
    }
    return cache[n]
}

let num = Int(readLine()!)!
var ans: [Int] = []
for _ in 1...num {
    ans.append(Int(readLine()!)! - 1)
}

for i in ans {
    print(P(i))
}
