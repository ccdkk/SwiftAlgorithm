//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/1/23.
//

import Foundation

let n = Int(readLine()!)!
var nums: [Int] = readLine()!.split(separator: " ").map { Int($0)! }

for (i, num) in nums.enumerated() {
    if i == 0 {
        continue
    }
    nums[i] = max(num, nums[i - 1] + num)
}

print(nums.max()!)
