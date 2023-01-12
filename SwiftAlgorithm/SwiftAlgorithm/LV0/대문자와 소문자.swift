//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/01/01.
//

import Foundation

func solution(_ my_string:String) -> String {
    return my_string.map { $0.isLowercase ? $0.uppercased() : $0.lowercased() }.joined()
}
