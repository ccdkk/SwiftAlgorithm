//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/01/02.
//

import Foundation

func mySolution(_ num:Int, _ k:Int) -> Int {
    var nums = String(num).map { Int(String($0)) }
    return nums.contains(k) ? nums.firstIndex(of: k)! + 1 : -1
}

func solution1(_ num:Int, _ k:Int) -> Int {
    // ??를 이용하여 예외처리 하기
    // 의미없는 -을 추가해줌으로써 firstIndex를 강제언랩하여 + 1을 안해줘도 된다.
    // firstIndex는 결과값으로 Int?를 내보내기 때문에 해당 char이 존재하지 않는다면 -1을 return 한다.
        return Array("-\(num)").firstIndex(of: Character(String(k))) ?? -1
}
