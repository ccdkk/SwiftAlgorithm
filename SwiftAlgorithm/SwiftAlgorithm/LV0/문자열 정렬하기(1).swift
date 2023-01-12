//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/01/01.
//

import Foundation

func mySolution(_ my_string:String) -> [Int] {
    let rest = my_string.components(separatedBy: CharacterSet.decimalDigits.inverted).flatMap { Array(String($0)) }
    return rest.map { Int(String($0))! }.sorted(by: < )
}

func solution1(_ my_string:String) -> [Int] {
    return my_string.filter{$0.isNumber}.map{Int(String($0))!}.sorted(by: <)
}

