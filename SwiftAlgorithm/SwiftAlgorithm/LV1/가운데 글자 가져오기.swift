//
//  File.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/07/06.
//

import Foundation

func solution(_ s:String) -> String {
    let center = s.count / 2
    let str = Array(s)
    
    if s.count % 2 == 0 {
        let range = s.index(s.startIndex, offsetBy: center - 1) ... s.index(s.startIndex, offsetBy: center)
        return String(s[range])
        
    } else {
        return String(Array(s)[center])
    }
    
}

// 좋은 풀이

func solution2(_ s:String) -> String {

    return String(s[String.Index(encodedOffset: (s.count-1)/2)...String.Index(encodedOffset: s.count/2)])
}




