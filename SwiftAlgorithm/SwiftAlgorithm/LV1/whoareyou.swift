//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/07/13.
//

import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    
    func sum(_ arr3:[Int],_ arr4:[Int]) -> [Int]{
        var ans: [Int] = []
        
        for (idx, num) in arr3.enumerated() {
            ans.append(num + arr4[idx])
        }
        return ans
    }
    
    return zip(arr1, arr2).map {  sum($0, $1) }
}

// 좋은 풀이

func solution2(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    print(zip(arr1, arr2).map{zip($0,$1)}[0])
    print(zip(arr1, arr2).map{zip($0,$1)}[0].map {$0 + $1})
        
        print(zip(arr1, arr2).map{zip($0,$1).map{$0+$1}})
    return zip(arr1, arr2).map{zip($0,$1).map{$0+$1}}
}
