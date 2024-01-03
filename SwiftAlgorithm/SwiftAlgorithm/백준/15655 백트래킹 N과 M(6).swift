//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 1/2/24.
//

import Foundation


let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var nums = readLine()!.split(separator: " ").map { Int($0)! }
nums.sort()
var isUsed = [Bool](repeating: false, count: n+1)

func backTracking(count: Int, curNums: [String], startIndex: Int) {
    if count == m {
        print(curNums.joined(separator: " "))
        return
    }
    
    for i in startIndex..<n {
        var newNums = curNums
        newNums.append(String(nums[i]))
        backTracking(count: count+1, curNums: newNums, startIndex: i+1)
    }
}

backTracking(count: 0, curNums: [], startIndex:0)
