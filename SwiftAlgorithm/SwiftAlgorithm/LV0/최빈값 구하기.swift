//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/02/15.
//

import Foundation

func solution(_ array:[Int]) -> Int {
    var dic: [Int: Int] = [:]
    
    print(Dictionary(grouping: array, by: { int in
        int + 1
    }))
    for int in array {
        if dic[int] == nil {
            dic[int] = 1
        } else {
            dic[int]! += 1
        }
    }
    
    let filteredSorteDic = dic.filter { $0.value == dic.values.max()}
    
    if filteredSorteDic.count > 1 {
        return -1
    } else {
        return filteredSorteDic.first!.key
    }
}

print(solution([1, 2, 3, 3, 3, 4]))
