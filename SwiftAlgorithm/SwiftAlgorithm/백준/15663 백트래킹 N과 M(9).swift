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
var arr = [String](repeating: "", count: m)
var isUsed = [Bool](repeating: false, count: n+1)
var result = ""
var check = Set<String>()

func backTracking(count: Int) {
    if count == m {
        let resultString = arr.joined(separator: " ")
        if !check.contains(resultString) {
            check.insert(resultString)
            result += resultString + "\n"
        }
        return
    }
    
    for i in 0..<n {
        if !isUsed[i] {
            arr[count] = String(nums[i])
            isUsed[i] = true
            backTracking(count: count+1)
            isUsed[i] = false
        }
    }
}

backTracking(count: 0)
print(result)
