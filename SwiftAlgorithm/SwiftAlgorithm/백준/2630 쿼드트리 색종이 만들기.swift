//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/21/23.
//

import Foundation

let N = Int(readLine()!)!
var colors: [[Int]] = []
var ans: [Int] = [0,0]
for _ in 0..<N {
    let newColor = readLine()!.split(separator: " ").map { Int($0)! }
    colors.append(newColor)
}

func check(start: [Int], range: Int) {
    let newRange = range / 2
    var sums = [0,0,0,0]
    for i in start[0]..<start[0]+newRange {
        for j in start[1]..<start[1]+newRange {
            sums[0] += colors[i][j]
            sums[1] += colors[i][j+newRange]
            sums[2] += colors[i+newRange][j]
            sums[3] += colors[i+newRange][j+newRange]
        }
    }
    
    let blueTarget = newRange * newRange
    if sums[0] == blueTarget {
        ans[1] += 1
    } else if sums[0] == 0 {
        ans[0] += 1
    } else {
        check(start: start, range: newRange)
    }
    if sums[1] == blueTarget {
        ans[1] += 1
    } else if sums[1] == 0 {
        ans[0] += 1
    } else {
        check(start: [start[0], start[1] + newRange], range: newRange)
    }
    if sums[2] == blueTarget {
        ans[1] += 1
    } else if sums[2] == 0 {
        ans[0] += 1
    } else {
        check(start: [start[0] + newRange, start[1]], range: newRange)
    }
    if sums[3] == blueTarget {
        ans[1] += 1
    } else if sums[3] == 0 {
        ans[0] += 1
    } else {
        check(start: [start[0] + newRange, start[1] + newRange], range: newRange)
    }
}
var count = 0
for i in 0..<N {
    for j in 0..<N {
        count += colors[i][j]
    }
}
if count == N * N {
    ans[1] += 1
} else if count == 0 {
    ans[0] += 1
} else {
    check(start: [0, 0], range: N)
}
print(ans[0])
print(ans[1])
