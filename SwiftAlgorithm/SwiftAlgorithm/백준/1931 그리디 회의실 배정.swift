//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/9/23.
//

import Foundation

/*
 접근법
 
 meeting 시간이 짧고, 시작 시간이 이전 meeting과 가까울 수록 많이 배치할 수 있음
 첫번째 미팅을 선택할 떄 meeting의 시작 시작이 빠르고, 짧은 것을 배치해야함
 회의의 수는 100,000개 주어지므로 O(N^2)이 나오면 안됨.
 
 정렬 후 완전 탐색을 하면 경우의 수가 맞을 것 같음
 
 시작시간이 빠른 것으로 정렬을 하게되면, 예시에서 원래는 (1,4)가 선택되어야 하는데
 (0,6)이 선택되어버림. 그 이유는 시작시간을 기준으로 하게 되면 끝나는 시간이 제각각이여서
 '이전 meeting과 가까울 수록 많이 배치할 수 있다'를 제대로 검증할 수 없음.
 
 그럼 끝나는 시간이 빠른 순으로 정렬해보면, 첫번째 요소에서 경우의 수가 여러개가 나올 수 있지만
 해당 구간에서 어차피 최종 개수는 한 개만 나오기 때문에 상관이 없다.
 ex) (1,3), (0,3) 이렇게 있는 경우 (1,3)이든 (0,3)이든 해당 범위내에서 2개가 나오지 않으므로
 무엇을 선택해도 상관 없음.
 그런다음
- 미팅의 시작시간이 3보다 같거나 느리고
- 미팅의 끝나는 시간이 작은
 미팅을 배치하면 최대 미팅을 배치할 수 있음
 
 그래서 최종적으로 끝나는시간이 빠른것 & 끝나는시간이 같으면 시작시간이 빠른 것
 순으로 정렬을 한뒤 완전 탐색을 돌리면 최대 개수를 구할 수 있다.
 */

let N = Int(readLine()!)!
var meetings: [[Int]] = []
var endTime = 0
var count = 0
for _ in 0..<N {
    meetings.append(readLine()!.split(separator: " ").map { Int($0)! })
}

meetings.sort { ($0[1], $0[0]) < ($1[1], $1[0]) }


for meeting in meetings {
    if endTime == 0 {
        endTime = meeting[1]
        count += 1
    } else {
        if meeting[0] < endTime {
            continue
        } else {
            endTime = meeting[1]
            count += 1
        }
    }
}

print(count)
