//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 1/1/24.
//

import Foundation

let NS = readLine()!.split(separator: " ").map { Int($0)! }
let N = NS[0], S = NS[1]
let input = readLine()!.split(separator: " ").map { Int($0)! }
var isUsed = [Bool](repeating: false, count: N)

var ans = 0

func backTracking(count: Int, curNums: [Int]) {
    if count == N {
        let sum = curNums.reduce(0)  { $0 + $1 }
        if sum == S {
            ans += 1
        }
        return
    }
    
    var newNums = curNums
    newNums.append(input[count])
    backTracking(count: count + 1, curNums: newNums)
    backTracking(count: count + 1, curNums: curNums)
}

backTracking(count: 0, curNums: [])
if S == 0 {
    print(ans - 1)
} else {
    print(ans)
}

