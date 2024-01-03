//
//  최소직사각형.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/17/23.
//

import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    // [큰, 작은]
    // 으로 정렬하고 큰 에서 가장 작은거, 작은거에서 가장 작은거 선택
    var sortSizes = sizes.map { [max($0[0], $0[1]), min($0[0], $0[1])] }
    var width = sortSizes.map { $0[0] }.max()!
    var height = sortSizes.map { $0[1] }.max()!
    
    return width * height
}
