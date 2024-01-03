//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/9/23.
//

import Foundation

let input = readLine()!
let nums = input.components(separatedBy: ["+", "-"]).map { Int($0)! }
let operators = input.components(separatedBy: .decimalDigits).filter { $0 != ""}
var ans = 0
var minusIndex: [Int] = []
for (i, oper) in operators.enumerated() {
    if oper == "-" {
        minusIndex.append(i)
    }
}

if minusIndex.isEmpty {
    ans = nums.reduce(0) { $0 + $1 }
} else {
    minusIndex.append(nums.count - 1)
    for (i, n) in minusIndex.enumerated() {
        if i == 0 {
            ans += nums[0...n].reduce(0) { $0 + $1 }
        } else {
            ans -= nums[(minusIndex[i-1]+1)...minusIndex[i]].reduce(0) { $0 + $1 }
        }
    }
}

print(ans)

// 간단한 풀이
// -를 기준으로 구간을 나눠준다.
let expression = readLine()!.split(separator: "-")
var answer = 0

// 첫번째 구간은 ans에 더해준다.
for i in expression[0].split(separator: "+") {
    answer += Int(i)!
}

// 나머지 구간은 ans에서 뺴준다.
for i in expression[1...] {
    for j in i.split(separator: "+") {
        answer -= Int(j)!
    }
}

print(answer)
