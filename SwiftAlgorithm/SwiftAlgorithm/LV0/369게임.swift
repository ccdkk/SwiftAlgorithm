//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/01/03.
//

import Foundation

func mySolution(_ order:Int) -> Int {
    return String(order).filter { [3, 6, 9].contains(Int(String($0))) }.count
}

func mySolution1(_ order:Int) -> Int {
    return String(order).filter { "369".contains($0) }.count
}
