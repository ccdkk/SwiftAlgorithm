//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/01/10.
//

import Foundation

func solution(_ before:String, _ after:String) -> Int {
    return before.sorted() == after.sorted() ? 1 : 0
}
