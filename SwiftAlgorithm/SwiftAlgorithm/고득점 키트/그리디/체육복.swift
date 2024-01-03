//
//  체육복.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/28/23.
//

import SwiftUI

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    // reverse, ㅣost에서도 제외 중에 도난당한 사람 제외
    var newLost = lost
    var newReserve = reserve
    let lostSet = Set(lost)
    let reserveSet = Set(reserve)
    let intersect = lostSet.intersection(reserveSet)
    for n in intersect {
        let lostIndex = newLost.firstIndex(of: n)!
        let reserveIndex = newReserve.firstIndex(of: n)!
        newLost.remove(at: lostIndex)
        newReserve.remove(at: reserveIndex)
    }
    var ans = n - newLost.count
    newLost.sort() // 테스트케이스 13, 14에서 틀렸는데 그 이유는 newLost가 정렬되지 않은 경우에는 앞번호를 무조건 빌려주는 그리디 로직이 제대로 적용되지 않기 때문.
    for n in newLost {
        if newReserve.contains(n-1) && newReserve.contains(n+1) {
            ans += 1
            let index = newReserve.firstIndex(of: n-1)!
            newReserve.remove(at: index)
        } else if newReserve.contains(n-1) {
            ans += 1
            let index = newReserve.firstIndex(of: n-1)!
            newReserve.remove(at: index)
        } else if newReserve.contains(n+1) {
            ans += 1
            let index = newReserve.firstIndex(of: n+1)!
            newReserve.remove(at: index)
        }
    }
    
    return ans
}
