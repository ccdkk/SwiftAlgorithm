//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/22/23.
//

import Foundation

func solution(_ places:[[String]]) -> [Int] {
    func checkDistance(place: [[Character]], _ x:Int,_ y: Int) -> Bool {
        // 15테케 에서 시간 초과났는데 x, y 범위가 넓은 요소로 위로 올리니 통과함
        if x <= 3 && y <= 3 {
            if place[x+1][y+1] == "P" {
                if place[x+1][y] == "O" || place[x][y+1] == "O" {
                    return false
                }
            }
        }
        
        if x <= 3 && y >= 1 {
            if place[x+1][y-1] == "P" {
                if place[x][y-1] == "O" || place[x+1][y] == "O" {
                    return false
                }
            }
        }
        
        if y <= 3 {
            if place[x][y+1] == "P" {
                 return false
            }
        }
        
        if x <= 3 {
            if place[x+1][y] == "P" {
                return false
            }
        }
        
        if x <= 2 {
            if place[x+2][y] == "P" {
                if place[x+1][y] == "O" {
                    return false
                }
            }
        }
        
        if y <= 2 {
            if place[x][y+2] == "P" {
                if place[x][y+1] == "O" {
                    return false
                }
            }
        }
        
        return true
    }
    var ans: [Int] = []
    for place in places {
        let placeArr = place.map { Array($0) }
        var isFalse = false
        for i in 0..<5 {
            for j in 0..<5 {
                if placeArr[i][j] == "P" {
                    if !checkDistance(place: placeArr, i, j) {
                        ans.append(0)
                        isFalse = true
                        break
                    }
                }
            }
            if isFalse {
                break
            }
        }
        if !isFalse {
            ans.append(1)
        }
    }
    return ans
}


print(solution([["POOOP", "OXXOX", "OPXPX", "OOXOX", "POXXP"], ["POOPX", "OXPXP", "PXXXO", "OXXXO", "OOOPP"], ["PXOPX", "OXOXP", "OXPOX", "OXXOP", "PXPOX"], ["OOOXX", "XOOOX", "OOOXX", "OXOOX", "OOOOO"], ["PXPXP", "XPXPX", "PXPXP", "XPXPX", "PXPXP"]]))
