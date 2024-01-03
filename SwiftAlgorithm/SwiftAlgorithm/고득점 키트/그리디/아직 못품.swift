//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/28/23.
//

import Foundation


func solution(_ name:String) -> Int {
    let alphabet: [Character] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    var upDown = 0
    var leftRight = 0
    var changedIndex: [Int] = [0]
    var current = 0
    for (i, n) in name.enumerated() {
        let index = alphabet.firstIndex(of: n)!
        if index >= 13 {
            upDown += 26 - index
        } else {
            upDown += index
        }
        if index != 0 && i != 0{
            changedIndex.append(i)
        }
    }

    while !changedIndex.isEmpty {
        let nowIndex = changedIndex.firstIndex(of: current)!
        let nextIndex = nowIndex == changedIndex.count - 1 ? 0 : nowIndex + 1
        let prevIndex = nowIndex == 0 ? changedIndex.count - 1 : nowIndex - 1
        
        var nextDiff = changedIndex[nextIndex] - current
        var prevDiff = name.count - changedIndex[prevIndex] + current
        
        
        if changedIndex[prevIndex] < current {
            prevDiff = current - changedIndex[prevIndex]
        }
        
        if changedIndex[nextIndex] < current {
            nextDiff = name.count - current + changedIndex[nextIndex]
        }
        
        if nextDiff <= prevDiff {
            current = changedIndex[nextIndex]
            changedIndex.remove(at: nowIndex)
            leftRight += nextDiff
        } else {
            current = changedIndex[prevIndex]
            changedIndex.remove(at: nowIndex)
            leftRight += prevDiff
        }
    }
    return upDown + leftRight
}

//print(solution("JEROEN"))
print(solution("JAANAAAAN"))
