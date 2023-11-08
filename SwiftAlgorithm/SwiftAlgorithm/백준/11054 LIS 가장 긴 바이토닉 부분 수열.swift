//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/3/23.
//

import Foundation

let N = Int(readLine()!)!
var nums = readLine()!.split(separator: " ").map { Int($0)! }
var reverse = Array(nums.reversed())
// reversed()하여 Array를 다시 감싸주면 Int로 인덱싱가능
var dp1: [Int] = Array(repeating: 1, count: N)
var dp2: [Int] = Array(repeating: 1, count: N)
var ans: [Int] = Array(repeating: 0, count: N)

for (i, n) in nums.enumerated() {
    for j in 0..<i {
        if n > nums[j] {
            dp1[i] = max(dp1[j] + 1, dp1[i])
        }
    }
}


for (i, n) in reverse.enumerated() {
    for j in 0..<i {
        if n > reverse[j] {
            dp2[i] = max(dp2[j] + 1, dp2[i])
        }
    }
}

for i in 0..<N {
    ans[i] = dp1[i] + dp2[N - i - 1] - 1
}

print(ans.max()!)
