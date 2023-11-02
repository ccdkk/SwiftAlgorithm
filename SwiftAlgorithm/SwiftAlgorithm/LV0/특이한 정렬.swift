//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/02/10.
//

import Foundation

func solution(_ numlist:[Int], _ n:Int) -> [Int] {
    return numlist.sorted(by: { (abs($0 - n), $1) < (abs($1 - n), $0)})
}
