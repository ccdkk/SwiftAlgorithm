//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/22/23.
//

import Foundation

class Node {
    var data: Int
    var next: Node?
    var prev: Node?
    
    init(data: Int, next: Node? = nil, prev: Node? = nil) {
        self.data = data
        self.next = next
        self.prev = prev
    }
}

struct LinkedList {
    var head: Node?
    var tail: Node?
    var cursor: Node?
    var isDeleted: [Bool] = []
    
    mutating func append(data: Int, isInitCursor: Bool) {
        let node = Node(data: data)
        // 초기 선택값을 지정
        if isInitCursor { cursor = node }
        
        if head == nil {
            head = node
            tail = node
        } else {
            // head가 없으면 이미 head, tail값을 정해져 있다.
            node.prev = tail
            tail?.next = node
            tail = node
        }
        isDeleted.append(false)
    }
    
    mutating func remove() -> Node? {
        let delNode = cursor
        
        // cursor의 좌우를 서로 연결한다
        cursor?.next?.prev = cursor?.prev
        cursor?.prev?.next = cursor?.next
        // cursor의 next가 없으면 이전것으로, 있다면 다음것으로 cursor 설정
        cursor = delNode?.next == nil ? delNode?.prev : delNode?.next
        isDeleted[delNode!.data] = true
        return delNode
    }
    
    mutating func restore(node: Node?) {
        // 마지막으로 삭제한 것을 복원하므로, 삭제되기전 prev, next에 연결되어 있는 Node가 남아있다.
        node?.prev?.next = node
        node?.next?.prev = node
        isDeleted[node!.data] = false
    }
    
    mutating func moveUp(to amount: Int) {
        for _ in 0..<amount {
            cursor = cursor?.prev
        }
    }
    
    mutating func moveDown(to amount: Int) {
        for _ in 0..<amount {
            cursor = cursor?.next
        }
    }
}

func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    var table = LinkedList()
    var deleteStack: [Node?] = []
    
    for i in 0..<n {
        table.append(data: i, isInitCursor: i == k)
    }
    
    for command in cmd {
        let splitCommand = command.split(separator: " ")
        switch splitCommand[0] {
        case "D":
            table.moveDown(to: Int(splitCommand[1])! )
        case "U":
            table.moveUp(to: Int(splitCommand[1])!)
        case "C":
            deleteStack.append(table.remove())
        case "Z":
            table.restore(node: deleteStack.removeLast())
        default: break
        }
    }
    var ans = ""
    for isDelete in table.isDeleted {
        ans.insert(isDelete ? "X" : "O", at: ans.endIndex)
    }
    // table.isDeleted.map { $0 ? : "X" : "O"}.joined() 에서 위처럼 바꿨더니 효율성 테스트1 시간초과 통과함. 왜그럴까..?
    return ans
}
