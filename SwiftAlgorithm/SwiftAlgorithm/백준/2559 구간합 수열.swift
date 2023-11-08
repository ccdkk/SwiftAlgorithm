//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/7/23.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let K = input[1]
let nums = [0] + readLine()!.split(separator: " ").map { Int($0)! }
var psum = Array(repeating: 0, count: N + 1)
var ans: [Int] = []

for i in 1...N {
    psum[i] += psum[i-1] + nums[i]
}

for i in K...N {
    ans.append(psum[i] - psum[i-K])
}

print(ans.max()!)
