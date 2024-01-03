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
var result = ""
func backTracking(count: Int) {
    if count == m {
        result += arr.joined(separator: " ") + "\n"
        return
    }
    
    for i in 0..<n {
        arr[count] = String(nums[i])
        backTracking(count: count+1)
    }
}

backTracking(count: 0)
print(result)
