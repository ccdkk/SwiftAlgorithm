//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/13/23.
//

import Foundation

struct Heap<T: Comparable> {
    var heap: Array<T> = []
    
    init() { }
    
    init(data: T) {
        // append를 두 번 한 것은 0번 index를 임의로 채우기 위함
        // 실제 Node의 시작은 1번 index부터니까
        heap.append(data)
        heap.append(data)
    }
    
    mutating func insert(_ data: T) {
        if heap.count == 0 {
            heap.append(data)
            heap.append(data)
            return
        }
        
        heap.append(data)
        
        func isMoveUp(_ insertIndex: Int) -> Bool {
            if insertIndex <= 1 {
                return false
            }
            
            //완전 이진 트리에서 부모의 index는 자식index를 2로 나눈 몫이다.
            let parentIndex: Int = insertIndex / 2
            // 부모값보다 data의 값이 크다면 옮겨야 한다.
            return heap[insertIndex] > heap[parentIndex]
        }
        
        var insertIndex: Int = heap.count - 1
        while isMoveUp(insertIndex) {
            let parentIndex: Int = insertIndex / 2
            heap.swapAt(insertIndex, parentIndex)
            insertIndex = parentIndex
        }
    }
    
    enum moveDownStatus {
        case none, left, right
    }
    
    mutating func pop() -> T? {
        if heap.count <= 1 { return nil }
        
        let returnData = heap[1] // 최대값
        heap.swapAt(1, heap.count - 1) // 최대값과 마지막 요소의 위치를 바꿈
        heap.removeLast() // 최대값 remove
        
        func moveDown(_ poppedIndex: Int) -> moveDownStatus {
            let leftChildIndex = poppedIndex * 2
            let rightChildIndex = leftChildIndex + 1
            
            // 자식 노드가 없는 경우
            if leftChildIndex >= heap.count {
                return .none
            }
            
            // 왼쪽 자식 노드만 있는 경우
            if rightChildIndex >= heap.count {
                return heap[leftChildIndex] > heap[poppedIndex] ? .left : .none
            }
            
            // 자식 노드가 모두 작은 경우
            if (heap[leftChildIndex] < heap[poppedIndex]) && (heap[rightChildIndex] < heap[poppedIndex]) {
                return .none
            }
            
            // 자식 노드가 모두 큰 경우에는 더 큰 자식을 선택
            if (heap[leftChildIndex] > heap[poppedIndex]) && (heap[rightChildIndex] > heap[poppedIndex]) {
                return heap[leftChildIndex] > heap[rightChildIndex] ? .left : .right
            }
            
            // 자식 노드 중 한 자식만 자신보다 큰 경우
            return heap[leftChildIndex] > heap[poppedIndex] ? .left : .right
        }
        
        var poppedIndex = 1 // rootNode로 얼떨결에 올라온 노드의 위치를 찾아주어야 함.
        while true {
            switch moveDown(poppedIndex) {
            case .none:
                return returnData
            case .left:
                let leftChildIndex = poppedIndex * 2
                heap.swapAt(poppedIndex, leftChildIndex)
                poppedIndex = leftChildIndex
            case .right:
                let rightChildIndex = (poppedIndex * 2) + 1
                heap.swapAt(poppedIndex, rightChildIndex)
                poppedIndex = rightChildIndex
            }
        }
    }
}


let N = Int(readLine()!)!
var heap = Heap<Int>()
heap.heap.append(0)
for _ in 0..<N {
    let input = Int(readLine()!)!
    if input == 0 {
        if let max = heap.pop() {
            print(max)
        } else {
            print(0)
        }
    } else {
        heap.insert(input)
    }
}

