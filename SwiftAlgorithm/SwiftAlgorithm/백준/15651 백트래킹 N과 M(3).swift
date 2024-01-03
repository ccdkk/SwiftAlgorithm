//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 1/2/24.
//

import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]

func backTracking(count: Int, curNums: [String]) {
    if count == m {
        print(curNums.joined(separator: " "))
        return
    }
    
    for i in 1..<n+1 {
        var newNums = curNums
        newNums.append(String(i))
        backTracking(count: count+1, curNums: newNums)
    }
}

backTracking(count: 0, curNums: [])
