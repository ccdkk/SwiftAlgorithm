//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/02/21.
//

import Foundation

// 틀린 풀이, 연속된 꼭지점에서 2이상의 값을 가질 때 예외처리가 안됨.
func solution(_ lines:[[Int]]) -> Int {
    let min = lines.map { $0[0] }.min()!
    let max = lines.map { $0[1] }.max()!
    
    var totalLine = Array(repeating: 0, count: max - min + 1)
    let moveLine = lines.map { [$0[0] - min, $0[1] - min] }
    moveLine.forEach { line in
        for int in line[0]...line[1] {
            totalLine[int] += 1
        }
    }
    var filterTotalLine = totalLine.map { $0 < 2 ? "0" : "\($0)" }
    let arr = filterTotalLine.joined().components(separatedBy: "0").filter { $0.count != 0 }
    print(filterTotalLine)
    print(arr)
    var ans = 0
    arr.forEach { element in
            ans += element.count - 1
    }
    
    return ans
}

print(solution([[0, 2], [-3, -1], [-2, 1]]))


func solution1(_ lines:[[Int]]) -> Int {
    var answer = 0
    let minLength = lines.map{ $0[0]}.min()!
    let maxLength = lines.map{ $0[1]}.max()!
    for i in minLength...maxLength {
        var count = 0
        for line in lines {
            if line[0] ..< line[1] ~= i {
                count += 1
            }
        }
        if count >= 2 {
            answer += 1
        }
    }
    
    return answer
}
