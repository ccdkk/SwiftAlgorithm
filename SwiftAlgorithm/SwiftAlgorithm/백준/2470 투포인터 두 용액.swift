//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/14/23.
//

import Foundation

let N = Int(readLine()!)!
var nums = readLine()!.split(separator: " ").map { Int($0)! }
nums.sort()
var start = 0
var end = N - 1
var nearZeroSum = max(nums.max()! * 2, abs(nums.min()! * 2)) // nearZeroSum을 abs로 판단하기 때문에 min, max의 2배 한 값중 절댓값이 큰 것이 가장 0에서 먼 값이다. 여차하면 그냥 주어지는 input의 구간 최댓값 * 2로 하면 될듯
var ans: [Int] = [0, 0]

while start != end {

    let sum = nums[start] + nums[end]
    
    if sum > 0 {
        if sum < nearZeroSum {
            ans = [start, end]
            nearZeroSum = sum
            end -= 1
        } else {
            end -= 1
        }
    } else if sum < 0 {
        if abs(sum) < nearZeroSum {
            ans = [start, end]
            nearZeroSum = abs(sum)
            start += 1
        } else {
            start += 1
        }
    } else if sum == 0 {
        ans = [start, end] // 바로 프린트 해주면 아래에서 잘못된 값을 또 프린트 하기 때문에 할당만
        break
    }
}

print("\(nums[ans[0]]) \(nums[ans[1]])")
