//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/01/10.
//

import Foundation

func solution(_ s:String) -> String {
    return String(s.filter { s.components(separatedBy: String($0)).count == 2 }.sorted())
}

func solution1(_ s: String) -> String {
    return Dictionary(grouping: Array(s).map(String.init), by: { $0 }).filter { $0.value.count <= 1 }
        .map { $0.key }
        .sorted(by: <)
        .joined()
}

print(solution("abdc"))
