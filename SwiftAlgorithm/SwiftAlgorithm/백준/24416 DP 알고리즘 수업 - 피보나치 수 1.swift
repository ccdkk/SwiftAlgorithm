//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/1/23.
//

import Foundation

var sequence = [0, 1]
for i in 2...40 {
    sequence.append(sequence[i - 2] + sequence[i - 1])
}

let n = Int(readLine()!)!
print(sequence[n], n - 2)
