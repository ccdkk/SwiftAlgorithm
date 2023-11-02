//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/02/23.
//

import Foundation

func solution(_ dots:[[Int]]) -> Int {
    let input = dots
    
    for index in 1...3 {
        var input2 = dots
        input2.remove(at: index)
        input2.remove(at: 0)

        let linear1 = Double((input[0][1] - input[index][1])) / Double((input[0][0] - input[index][0]))
        let linear2 = Double((input2[0][1] - input2[1][1])) / Double((input2[0][0] - input2[1][0]))
        
        if linear1 == linear2 {
            return 1
        } else {
            continue
        }
    }
    return 0
}

print(solution([[1, 1], [10, 8], [7, 7], [8, 6]]))
