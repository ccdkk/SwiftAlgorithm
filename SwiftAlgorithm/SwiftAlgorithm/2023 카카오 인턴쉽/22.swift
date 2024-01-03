//
//  1.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/25/23.
//

import Foundation

func getDiceCombinations(_ dice: [Int], _ currentCombination: [Int], _ index: Int, _ result: inout [[Int]]) {
    if currentCombination.count == dice.count / 2 {
        result.append(currentCombination)
        return
    }

    for i in index..<dice.count {
        var newCombination = currentCombination
        newCombination.append(dice[i])
        getDiceCombinations(dice, newCombination, i + 1, &result)
    }
}

func doCombinations(_ dice: [Int]) -> [[Int]] {
    var result = [[Int]]()
    getDiceCombinations(dice, [], 0, &result)
    return result
}

func getDiceSumPermutation(diceCount diceCount: Int, dices:[[Int]]) -> [Int] {
    var result = [Int]()

    func doPermutations(_ currentSum: Int, _ remainingDice: Int) {
        if remainingDice == 0 {
            result.append(currentSum)
            return
        }

        for number in dices[remainingDice-1] {
            var newSum = currentSum
            newSum += number
            doPermutations(newSum, remainingDice-1)
        }
    }
    
    doPermutations(0, diceCount)
    return result
}

func solution(_ dice: [[Int]]) -> [Int] {
    var bestWin: Int = 0
    var ans: [Int] = []
    
    let combinations = doCombinations((1...dice.count).map { $0 })
    let newCombinations = combinations[0..<combinations.count / 2]
    
    for (i, combination) in newCombinations.enumerated() {
        var (win, draw, lose) = (0,0,0)
        var Adices: [[Int]] = []
        var Bdices: [[Int]] = []
        for num in combination {
            Adices.append(dice[num-1])
        }
        for num in combinations[combinations.count-i-1] {
            Bdices.append(dice[num-1])
        }
        var AresultDict: [Int:Int] = [:]
        var BresultDict: [Int:Int] = [:]
        var Aresult = getDiceSumPermutation(diceCount: Adices.count, dices: Adices)
        let Aset = Set(Aresult)
        var Bresult = getDiceSumPermutation(diceCount: Bdices.count, dices: Bdices)
        let Bset = Set(Bresult)
        for n in Aset {
            let filterd = Aresult.filter { $0 != n }
            let count = Aresult.count - filterd.count
            Aresult = filterd
            AresultDict[n] = count
        }
        
        for n in Bset {
            let filterd = Bresult.filter { $0 != n }
            let count = Bresult.count - filterd.count
            Bresult = filterd
            BresultDict[n] = count
        }
        
        for a in AresultDict.keys {
            for b in BresultDict.keys {
                if a > b {
                    win += AresultDict[a]! * BresultDict[b]!
                } else if a < b {
                    lose += AresultDict[a]! * BresultDict[b]!
                } else {
                    draw += AresultDict[a]! * BresultDict[b]!
                }
            }
        }
        
        if win >= lose {
            if win > bestWin {
                bestWin = win
                ans = combination
            }
        } else {
            if lose > bestWin {
                bestWin = lose
                ans = combinations[combinations.count-i-1]
            }
        }
    }

    return ans
}
let dice = [
    [1, 2, 3, 4, 5, 6],
    [3, 3, 3, 3, 4, 4],
    [1, 3, 3, 4, 4, 4],
    [1, 1, 4, 4, 5, 5]
]
print(solution(dice))

//    func generateCombinations(_ currentCombination: [Int], _ remainingDice: Int) {
//        if remainingDice == 0 {
//            result.append(currentCombination)
//            return
//        }
//
//        for number in dices[remainingDice-1] {
//            var newCombination = currentCombination
//            newCombination.append(number)
//            generateCombinations(newCombination, remainingDice-1)
//        }
//    }
