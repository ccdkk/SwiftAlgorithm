//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/01/10.
//

import Foundation

func solution(_ array:[Int], _ n:Int) -> Int {
    var arr = array.sorted(by: <).sorted { abs(n - $0) < abs(n - $1) }
    return arr.first!
}

func solution1(_ array:[Int], _ n:Int) -> Int { // 튜플 다중정렬을 이용한 좋은 풀이
    print(array.sorted(by: { (abs($0 - n), $0) < (abs($1 - n), $1) }))
    return array.min(by: { (abs($0 - n), $0) < (abs($1 - n), $1) })!
}

print(solution1([1, 3, 6, 8, 9, 11, 13], 10))
