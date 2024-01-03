//
//  키패드 누르기.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/24/23.
//

import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    var ans = ""
    var left = 10
    var right = 11
    var nums: [Int:[Int]] = [1:[0,0],2:[0,1],3:[0,2],4:[1,0],5:[1,1],6:[1,2],7:[2,0],8:[2,1],9:[2,2],0:[3,1], 10:[3,0], 11:[3,2]]
    
    func distance(from: Int, to: Int) -> Int {
        return abs(nums[from]![0] - nums[to]![0]) + abs(nums[from]![1] - nums[to]![1])
    }
    for num in numbers {
        if [1,4,7].contains(num) {
            ans += "L"
            left = num
        }
        
        if [2,5,8,0].contains(num) {
            let leftDistance = distance(from: left, to: num)
            let rightDistance = distance(from: right, to: num)
            if leftDistance > rightDistance {
                right = num
                ans += "R"
            } else if leftDistance < rightDistance {
                left = num
                ans += "L"
            } else {
                switch hand {
                    case "right":
                        right = num
                        ans += "R"
                    case "left":
                         left = num
                        ans += "L"
                    default: break
                }
            }
        }
        
        if [3,6,9].contains(num) {
            ans += "R"
            right = num
        }
    }
    
    return ans
}
