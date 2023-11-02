//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/02/16.
//

import Foundation

func solution(_ common:[Int]) -> Int {
    if common[2] - common[1] == common[1] - common[0] {
        return common.last! + common[1] - common[0]
    } else {
        return common.last! * (common[1] / common[0])
    }
}
