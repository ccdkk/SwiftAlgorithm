//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/01/16.
//

import Foundation

func solution(_ keyinput:[String], _ board:[Int]) -> [Int] {
    var ans: [Int] = [0, 0]
    let widthLimit = board[0] / 2
    let heightLimit = board[1] / 2
    keyinput.forEach { str in
        switch str {
        case "left":
            if ans[0] == -widthLimit {
                break
            } else {
                ans[0] += -1
            }
        case "right":
            if ans[0] == widthLimit {
                break
            } else {
                ans[0] += 1
            }
        case "up":
            if ans[1] == heightLimit {
                break
            } else {
                ans[1] += 1
            }
        case "down":
            if ans[1] == -heightLimit {
                break
            } else {
                ans[1] += -1
            }
        default:
            break
        }
    }
    return ans
}

func solution1(_ keyinput:[String], _ board:[Int]) -> [Int] {
    var x = 0,
        y = 0

    keyinput.forEach {
        switch $0 {
        case "up" where y < ((board[1] - 1) / 2): y += 1
        case "down" where y > -((board[1] - 1) / 2): y -= 1
        case "right" where x < ((board[0] - 1) / 2): x += 1
        case "left" where x > -((board[0] - 1) / 2): x -= 1
        default: break
        }
    }

    return [x, y]
}
