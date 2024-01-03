//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/25/23.
//

import Foundation

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    var giftIndices = [String: Int]()
    var giftHistory = [String: [String]]()
    var nextMonthGifts = [String: Int]()
    for gift in gifts {
        let components = gift.components(separatedBy: " ")
        let giver = components[0]
        let receiver = components[1]

        giftIndices[giver, default: 0] += 1
        giftIndices[receiver, default: 0] -= 1

        giftHistory[giver, default: []] += [receiver]
    }
    
    for me in friends {
        var giftsCount = 0
        let meIndex = friends.firstIndex(of: me)
        var friendsExceptMe = friends
        friendsExceptMe.remove(at: meIndex!)
        for friend in friendsExceptMe {
            // 준 기록이 있다면
            if giftHistory[me, default: []].contains(friend) || giftHistory[friend, default: []].contains(me) {
                let meCount = giftHistory[me, default: []].filter { $0 == friend }.count
                let friendCount = giftHistory[friend, default: []].filter { $0 == me }.count
                if meCount > friendCount {
                    nextMonthGifts[me, default: 0] += 1
                } else if meCount < friendCount {
                    nextMonthGifts[friend, default: 0] += 1
                } else {
                    // 주고받은 선물수가 같으면 지수 비교
                    let meIndex = giftIndices[me, default: 0]
                    let friendIndex = giftIndices[friend, default: 0]
                    if meIndex > friendIndex {
                        nextMonthGifts[me, default: 0] += 1
                    } else if meIndex < friendIndex {
                        nextMonthGifts[friend, default: 0] += 1
                    }
                }
            } else {
                // 주고받은 기록이 없으면
                let meIndex = giftIndices[me, default: 0]
                let friendIndex = giftIndices[friend, default: 0]
                if meIndex > friendIndex {
                    nextMonthGifts[me, default: 0] += 1
                } else if meIndex < friendIndex {
                    nextMonthGifts[friend, default: 0] += 1
                }
            }
        }
    }
    if let ans = nextMonthGifts.values.max() {
        return ans / 2
    } else {
        return 0
    }
}

//print(solution( ["muzi", "ryan", "frodo", "neo"],  ["muzi frodo", "muzi frodo", "ryan muzi", "ryan muzi", "ryan muzi", "frodo muzi", "frodo ryan", "neo muzi"]))
//print(solution( ["joy", "brad", "alessandro", "conan", "david"],  ["alessandro brad", "alessandro joy", "alessandro conan", "david alessandro", "alessandro david"]))
print(solution(["a", "b", "c"], ["a b", "b a", "c a", "a c", "a c", "c a"]))

