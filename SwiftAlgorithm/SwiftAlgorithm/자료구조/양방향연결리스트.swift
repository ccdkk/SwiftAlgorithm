//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/22/23.
//

import Foundation

class Node<T> {
    var prev: Node?
    var data: T?
    var next: Node?
    
    init(prev: Node? = nil, data: T?, next: Node? = nil) {
        self.prev = prev
        self.data = data
        self.next = next
    }
}

// Equatable은 노드 안의 데이터를 비교하기 위함
struct DoublyLinkedList<T: Equatable> {
    var head: Node<T>?
    var tail: Node<T>?
    
    mutating func append(data: T?) {
        if head == nil || tail == nil {
            head = Node.init(data: data)
            tail = head
            return
        }
        
        let newNode = Node(data: data)
        tail?.next = newNode
        newNode.prev = tail
        tail = newNode
    }
    
    mutating func removeLast() -> Node<T>? {
        if head == nil || tail == nil {
            return nil
        }
        
        // head를 삭제하는 경우
        if head?.next == nil {
            let delNode = head
            head = nil
            tail = nil
            return delNode
        }
        let delNode = tail
        tail?.prev?.next = nil
        tail = tail?.prev
        return delNode
    }
    
    mutating func searchNodeFromHead(with data: T?) -> Node<T>? {
        if head == nil || tail == nil {
            return nil
        }
        
        var node = head
        while node?.next != nil {
            if node?.data == data { break }
            node = node?.next
        }
        return node
    }
    
    mutating func searchNodeFromTail(with data: T?) -> Node<T>? {
        if head == nil || tail == nil {
            return nil
        }
        
        var node = tail
        while node?.prev != nil {
            if node?.data == data { break }
            node = node?.prev
        }
        return node
    }
}
