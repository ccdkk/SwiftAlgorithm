//
//  모의고사.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/17/23.
//

import Foundation

func solution(_ answers:[Int]) -> [Int] {
    // 패턴 5, 8, 10개
    let multiple = answers.count / 5
    var ans1: [Int] = []
    var ans2: [Int] = []
    var ans3: [Int] = []
    var score1: Int = 0
    var score2: Int = 0
    var score3: Int = 0
    for _ in 0..<multiple+1 {
        ans1 += [1,2,3,4,5]
        ans2 += [2,1,2,3,2,4,2,5]
        ans3 += [3,3,1,1,2,2,4,4,5,5]
    }
    
    for (i, ans) in answers.enumerated() {
        if ans1[i] == ans {
            score1 += 1
        }
        if ans2[i] == ans {
            score2 += 1
        }
        if ans3[i] == ans {
            score3 += 1
        }
    }
    let scores: [Int] = [score2, score3]
    var ans: [Int] = [1]
    var maxScore = score1
    for (i, score) in scores.enumerated() {
       if score == maxScore {
           ans.append(i+2)
       } else {
           ans = maxScore > score ? ans : [i+2]
           maxScore = max(maxScore, score)
       }
    }
    ans.sort()
    return ans
}

// dictionary를 이용한 좋은 풀이 나머지로 index에 접근한 것도 좋아보임
func solution(_ answers:[Int]) -> [Int] {
    let answer = (
        a: [1, 2, 3, 4, 5], // index % 5
        b: [2, 1, 2, 3, 2, 4, 2, 5], // index % 8
        c: [3, 3, 1, 1, 2, 2, 4, 4, 5, 5] // index % 10
    )
    var point = [1:0, 2:0, 3:0]

    for (i, v) in answers.enumerated() {
        if v == answer.a[i % 5] { point[1] = point[1]! + 1 }
        if v == answer.b[i % 8] { point[2] = point[2]! + 1 }
        if v == answer.c[i % 10] { point[3] = point[3]! + 1 }
    }

    return point.sorted{ $0.key < $1.key }.filter{ $0.value == point.values.max() }.map{ $0.key }
}
