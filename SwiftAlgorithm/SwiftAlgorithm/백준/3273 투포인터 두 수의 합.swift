//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/14/23.
//

import Foundation

let n = Int(readLine()!)!
var nums = readLine()!.split(separator: " ").map { Int($0)! }
nums.sort()
let target = Int(readLine()!)!

var start = 0
var end = n-1
var ans = 0

while start < n && end >= 0 {
    let sum = nums[start] + nums[end]
    if sum < target {
        start += 1
    } else if sum > target {
        end -= 1
    } else if sum == target {
        ans += 1
        start += 1
    }
}

// (2,6) (6,2)가 중복되어 체크 되므로 2로 나눠준다.
print(ans / 2)
