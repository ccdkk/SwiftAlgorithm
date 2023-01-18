//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/01/17.
//

import Foundation

func solution(_ dots:[[Int]]) -> Int {
    var movedDots = dots.map { [$0[0] - dots[0][0], $0[1] - dots[0][1]]  }
    
    let max = movedDots.max {
        ($0[0] * $0[0]) + ($0[1] * $0[1]) < ($1[0] * $1[0]) + ($1[1] * $1[1])
    }!
    
    return abs(max[0] * max[1])
}
