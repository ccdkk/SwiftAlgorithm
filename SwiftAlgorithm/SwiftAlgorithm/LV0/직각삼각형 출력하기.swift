//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/01/01.
//

import Foundation

let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }

for index in 1...n.first! {
    print(String(repeating: "*", count: index))
}
