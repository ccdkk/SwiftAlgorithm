//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 12/30/23.
//

import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var isUsed = [Bool](repeating: false, count: n)
var currentNum = [Int](repeating: 0, count: m)

func nmRecursion(count: Int) {
    if count == m {
        print(currentNum.map { String($0) }.joined(separator: " "))
        return
    }
    
    for i in 0..<n {
        if !isUsed[i] {
            currentNum[count] = i + 1
            isUsed[i] = true
            nmRecursion(count: count + 1)
            isUsed[i] = false
        }
    }
}

nmRecursion(count: 0)
