//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/01/10.
//

import Foundation

func solution(_ emergency:[Int]) -> [Int] {
    var sortedEmergency = emergency.sorted(by: >)
    return emergency.map { sortedEmergency.firstIndex(of: $0)! + 1 }
}

