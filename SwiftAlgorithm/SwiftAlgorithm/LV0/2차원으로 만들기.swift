//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/01/10.
//

import Foundation

func solution(_ num_list:[Int], _ n:Int) -> [[Int]] {
    var ans: [[Int]] = []
    var numList = num_list
    while !numList.isEmpty {
        var arr: [Int] = []
        for _ in (1...n) {
            arr.append(numList.removeFirst())
        }
        ans.append(arr)
    }
    return ans
}

func solution1(_ numList: [Int], _ n: Int) -> [[Int]] { // indices 키워드
    var answer = Array(repeating: Array(repeating: 0, count: n), count: numList.count / n)
    var count = 0
    for i in answer.indices {
        for j in answer[i].indices {
            answer[i][j] = numList[count]
            count += 1
        }
    }
    return answer
}

func solution2(_ num_list:[Int], _ n:Int) -> [[Int]] { // 좋은 풀이
    var result = Array(repeating: Array(repeating: 0, count: n), count: num_list.count / n)

    for idx in (0..<num_list.count) {
        result[idx / n][idx % n] = num_list[idx]
    }

    return result
}

var answer = Array(repeating: Array(repeating: 0, count: 3), count: 3)

print(answer.indices)
