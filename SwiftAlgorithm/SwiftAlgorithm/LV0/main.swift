//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/01/11.
//

import Foundation

func solution(_ numbers:[Int], _ k:Int) -> Int {
    return numbers[ (((2 * k - 1) % numbers.count) + numbers.count - 1) % numbers.count ]
}
