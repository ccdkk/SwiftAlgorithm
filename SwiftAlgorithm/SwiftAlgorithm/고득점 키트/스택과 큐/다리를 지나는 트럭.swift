//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 10/17/23.
//

import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var weightOnBridge = 0
    var trucksOnBridge: [(Int, Int)] = [(truck_weights[0], 1)]
    var waitingTrucks = truck_weights.dropFirst()
    var count = 1
    
    while !(trucksOnBridge.isEmpty) {
        count += 1
        trucksOnBridge = trucksOnBridge.filter { count - $0.1 < bridge_length }
        weightOnBridge = trucksOnBridge.reduce(0) { $0 + $1.0 }
        print(trucksOnBridge)
        
        if waitingTrucks.isEmpty {
            if trucksOnBridge.count == 1 {
                return trucksOnBridge.first!.1 + bridge_length
            }
        } else {
            if (weightOnBridge + waitingTrucks.first!) <= weight {
                let nextTruck = waitingTrucks.removeFirst()
                trucksOnBridge.append((nextTruck, count))
            }
        }
    }
    
    
    
    return count
}
