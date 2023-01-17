//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/01/16.
//

import Foundation

func solution(_ M:Int, _ N:Int) -> Int {
    return (max(M, N) * (min(M, N) - 1)) + max(M, N) - 1
}


func solution1(_ M:Int, _ N:Int) -> Int {
    return M * N - 1
}
