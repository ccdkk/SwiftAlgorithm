//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/01/03.
//

import Foundation

func solution(_ my_string:String) -> String {
    return my_string.map { String($0.lowercased()) }.sorted().joined()
}


// 시간 초과 : 위에 답안보다 O(N)이 추가로 들어감
func solution1(_ my_string:String) -> String {
    return my_string.lowercased().sorted().map { String($0) }.joined()
}

// map + joined를 reduce로 대체할 수 있음을 기억하자. 더 깔끔
