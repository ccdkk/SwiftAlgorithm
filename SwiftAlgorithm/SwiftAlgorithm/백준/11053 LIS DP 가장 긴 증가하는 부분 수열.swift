//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/2/23.
//

import Foundation

let N = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)! }
var ans = Array(repeating: 1, count: N)
var maxInt = nums[0]

// O(N^2)
for (i, n) in nums.enumerated() {
    for j in 0..<i {
        if n > nums[j] {
            ans[i] = max(ans[j] + 1, ans[i])
        }
    }
}

print(ans.max()!)
