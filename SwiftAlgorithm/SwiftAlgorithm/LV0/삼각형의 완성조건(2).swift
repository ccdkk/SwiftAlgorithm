//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/01/16.
//

import Foundation

func solution(_ sides:[Int]) -> Int {
    var ans = 0
    
    // 새로운 변이 가장 긴 경우
    (sides.max()! + 1)...(sides.min()! + sides.max()! - 1)
    // max가 가장 긴 경우
    ((sides.max()! - sides.min()!) + 1)...sides.max()!
    return 2 * sides.min()! - 1
}
