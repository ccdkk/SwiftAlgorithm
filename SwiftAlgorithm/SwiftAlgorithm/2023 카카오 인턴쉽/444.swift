//
//  2.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/25/23.
//

import Foundation

func solution(_ coin:Int, _ cards:[Int]) -> Int {
    var targetSum = cards.count + 1
    var hand: [Int] = Array(cards[0..<cards.count / 3])
    var nextCardStartIndex: Int = cards.count / 3
    var nextCardEndIndex = cards.count / 3
    var maxRound = (cards.count / 3) + 1
    var connectNums: [Int:Int] = [:]
    var remainCoin = coin
    var targetSumCount = 1
    var ans = 0
    var visited = [Bool](repeating: false, count: cards.count+1)
    for card in cards {
        connectNums[card] = targetSum - card
    }
    
    for card in hand {
        if hand.contains(connectNums[card]!) {
            if !visited[card] {
                visited[card] = true
                visited[connectNums[card]!] = true
                targetSumCount += 1
            }
        }
    }
    
    while targetSumCount > 0 {
        if nextCardEndIndex == cards.count {
            ans += targetSumCount
            ans = min(ans, maxRound)
            break
        }
        nextCardEndIndex += targetSumCount * 2
        var nextCards = cards[nextCardStartIndex..<nextCardEndIndex]
        ans += targetSumCount
        targetSumCount = 0
        if remainCoin > 0 {
            for nextCard in nextCards {
                if !visited[nextCard] {
                    if hand.contains(connectNums[nextCard]!) && remainCoin > 0 {
                        remainCoin -= 1
                        targetSumCount += 1
                        visited[nextCard] = true
                        visited[connectNums[nextCard]!] = true
                    }
                }
            }
        }

        if remainCoin > 1 && targetSumCount == 0 {
            for nextCard in nextCards {
                if !visited[nextCard] {
                    if nextCards.contains(connectNums[nextCard]!) && remainCoin > 1 {
                        targetSumCount += 1
                        remainCoin -= 2
                        visited[nextCard] = true
                        visited[connectNums[nextCard]!] = true
                    }
                }
            }
        }
        
        if targetSumCount == 0 {
            break
        }
        
    }
    return ans
}

//print(solution(4, [3,6,7,2,1,10,5,9,8,12,11,4]))
print(solution(3, [1,2,3,4,5,8,6,7,9,10,11,12]))
