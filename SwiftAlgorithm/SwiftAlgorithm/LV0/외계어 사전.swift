//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/01/16.
//

import Foundation

func solution(_ spell:[String], _ dic:[String]) -> Int {
    for str in dic {
        if Set(Array(str).map { String($0) }) == Set(spell) {
            return 1
        }
    }
    
    return 2
}

solution(["z", "d", "x"]   ,["def", "dww", "dzx", "loveaw"])
