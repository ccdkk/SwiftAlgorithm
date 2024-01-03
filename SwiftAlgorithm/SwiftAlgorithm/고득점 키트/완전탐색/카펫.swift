//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/17/23.
//

import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    // yellow를 곱셈으로 표현할 수 있는 경우를 찾고 갈색의 개수를 찾음.
    var width = 0
    var height = 0
    let upperBound = yellow / 2 >= 1 ? yellow / 2 : 1
    for n in 1...upperBound {
        if yellow % n != 0 {
            continue
        } else {
            let tempWidth = n
            let tempHeight = yellow / n
            let brownCount = (tempWidth * 2) + (tempHeight * 2) + 4
            if brownCount == brown {
                width = tempWidth + 2
                height = tempHeight + 2
            }
        }
    }
    var ans = [max(width, height), min(width, height)]
    return ans
}

print(solution(8, 1))
func permutation(nums: [Int], count: Int, rCount: Int) {
    if count == rCount {
        sumSet.append(Int(nums.joined()))
    }
    
    for (i, n) in nums.enumerted() {
        if visited[i] {
            continue
        }
        var newNums = nums
        newNums.append(n)
        visited[i] = true
        permutation(nums: newNums, count: count+1, rCount: rCount)
        visited[i] = false
    }
    
}


