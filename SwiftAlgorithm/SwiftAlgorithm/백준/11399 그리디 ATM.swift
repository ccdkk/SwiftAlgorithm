//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/9/23.
//

import Foundation

let N = Int(readLine()!)!

var times: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
var ans = 0
times.sort()

for (idx, time) in times.enumerated() {
    ans += time * (N - idx)
}
print(ans)
