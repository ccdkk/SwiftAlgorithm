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

func backTracking(count: Int, curNums: [String]) {
    if count == m {
        print(curNums.joined(separator: " "))
        return
    }
    
    for (i, value) in nums.enumerated() {
        if !isUsed[i] {
            isUsed[i] = true
            var newNums = curNums
            newNums.append(String(value))
            backTracking(count: count+1, curNums: newNums)
            isUsed[i] = false
        }
    }
}

backTracking(count: 0, curNums: [])
