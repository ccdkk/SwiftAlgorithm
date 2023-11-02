//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 10/31/23.
//

import Foundation

//
//변화시킬대상 절단기의 높이
//비교할 값은 얻는 나무의 양
//절단기의 높이를 설정했는데 우리가 가져가야할 양보다 적다면 -> 절단기를 낮춤
//우리가 가져가야할 양보다 많다면 절단기 높이를 높힘.
//
//절단기의 높이는 0부터 가장 큰 높이 까지.

let input = readLine()!.split(separator: " ")
let N = Int(input[0])!
let M = Int(input[1])!

let trees = readLine()!.split(separator: " ").map { Int($0)! }
var start = 0
var end = trees.max()!
var height = 0

while start <= end {
    let mid = (start + end) / 2
    let sum = trees.reduce(0) {
        if $1 > mid {
            return $0 + $1 - mid
        } else {
            return $0
        }
    }
    
    if sum >= M {
        start = mid + 1
        height = mid
    } else if sum < M{
        end = mid - 1
    }
}
print(height)
