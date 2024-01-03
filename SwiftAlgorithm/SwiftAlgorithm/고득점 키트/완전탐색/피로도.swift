//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/17/23.
//

import Foundation


func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var tired = k
    let orders = (1...dungeons.count).map { String($0) }
    var numSet: Set<String> = []
    var visited = [Bool](repeating: false, count: orders.count)
    func permutation(nums: [String], count: Int, rCount: Int) {
        if count == rCount {
            numSet.insert(nums.joined())
        }
        
        for (i, n) in orders.enumerated() {
            if visited[i] {
                continue
            }
            var newNums = nums
            newNums.append(n)
            visited[i] = true
            permutation(nums: newNums, count: count+1, rCount: rCount)
            visited[i] = false
        }
    }
    
    permutation(nums: [], count: 0, rCount:orders.count)
    
    var ans = 0
    
    for order in numSet {
        let orderArr = order.map { Int(String($0))! }
        var tempAns = 0
        for i in orderArr {
            let nowDungeon = dungeons[i-1]
            if tired >= nowDungeon[0] {
                tired -= nowDungeon[1]
                tempAns += 1
            } else {
                continue
            }
        }
        ans = max(ans, tempAns)
        tempAns = 0
        tired = k
    }
    return ans
}

// dfs는 모든 순열에 대해 순회해야하는 경우 사용하면 좋을 것 같다.
// visited를 하나만 놓고 해도 왜 되는지 모르겠지만 일단 됨.
// 굳이 permutation으로 순열을 만들고 해줄 필요 없는듯
func solution1(_ k: Int, _ dungeons: [[Int]]) -> Int {
    var result = 0
    
    var visited = [Bool](repeating: false, count: dungeons.count)
    
    func dfs(_ count: Int, _ pirodo: Int) {
        // 더 높은 값으로 바꿔줌
        if result < count {
            result = count
        }
        
        // 모든 순서 체크 가능 모든 던전이 시작점이 되어 실행되니까
        for i in 0..<dungeons.count {
            if !visited[i] && dungeons[i][0] <= pirodo {
                visited[i] = true
                dfs(count + 1, pirodo - dungeons[i][1])
                visited[i] = false
            }
        }
    }
    
    dfs(0, k)
    return result
}

print(solution1(80, [[80,20],[50,40],[30,10]]))
