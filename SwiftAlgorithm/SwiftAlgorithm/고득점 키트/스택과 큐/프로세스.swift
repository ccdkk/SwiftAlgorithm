//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 10/17/23.
//

import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var queue: [(priority: Int, index: Int)] = []
    
    for (index, priority) in priorities.enumerated() {
        queue.append((priority, index))
    }
    
    var count = 0
    
    while !queue.isEmpty {
        let current = queue.removeFirst()
        let maxPriority = queue.map { $0.priority }.max() ?? 0
        
        if current.priority >= maxPriority {
            count += 1
            
            if current.index == location {
                return count
            }
        } else {
            queue.append(current)
        }
    }
    
    return count
}
solution([1, 3, 5, 6], 3)
