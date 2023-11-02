//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/01/17.
//

import Foundation

func solution(_ A:String, _ B:String) -> Int {
    func push(_ str: String) -> String {
        var arr = str.map { String($0) }
        var pushedArr: [String] = [arr.removeLast()]
        pushedArr.append(contentsOf: arr)
        
        return pushedArr.joined()
    }
    
    var pushedList: [String] = [A]
    
    while pushedList.count < A.count {
        pushedList.append(push(pushedList.last!))
    }
    if let index = pushedList.firstIndex(of: B) {
        return index
    } else {
        return -1
    }
}

// 신박한 풀이, A + A는 밀리는 경우의 수를 모두 포함한 String이 된다.
// 따라서 B가 밀린 수라면 A + A는 B를 포함하므로, B로 나눠주면 두 등분이 되고, 밀린 횟수는 두번째 요소의 count가 된다.
func solution1(_ A:String, _ B:String) -> Int {
    let arr = (A+A).components(separatedBy: B)
    return arr.count == 1 ? -1 : arr[1].count
}

// 왜 array의 첫번째에 추가하는 것으로 insert를 까먹는가.
