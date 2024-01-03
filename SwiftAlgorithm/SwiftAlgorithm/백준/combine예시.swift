//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 10/25/23.
//

import Foundation
import Combine

// using Publisher and Subscriber

//let publisher = Just(5).subscribe(CustomSubscriber())
//let publisher = [1, 2, 3].publisher
//publisher
//    .print()
//    .subscribe(CustomSubscriber())
//

//let subscriber = publisher.sink { result in
//    switch result {
//    case .failure(let error):
//        print(error.localizedDescription)
//    case .finished:
//        print("finished")
//    }
//} receiveValue: { value in
//    print(value)
//}

class CustomSubscriber: Subscriber {
 
    typealias Input = Int
    
    typealias Failure = Never
    
    func receive(subscription: Subscription) {
        print("subscribe start")
        subscription.request(.max(3))
    }
    func receive(_ input: Int) -> Subscribers.Demand {
        return .max(1)
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        print(completion)
    }
}
// 
//let currentValueSubject = CurrentValueSubject<Int, Never>(0)
//let subscriber = currentValueSubject.sink { value in
//    print(value)
//}
//currentValueSubject.value = 5
//currentValueSubject.send(3)

//enum ExError: Error {
//    case testError
//}
//
//let passthroughSubject = PassthroughSubject<Int, Error>()
//let subscriber1 = passthroughSubject.sink { result in
//    switch result {
//    case .finished:
//        print("finished")
//    case .failure(let error):
//        print(error.localizedDescription)
//    }
//} receiveValue: { value in
//    print("subscriber1:", value)
//}
//
//let subscriber2 = passthroughSubject.sink { result in
//    switch result {
//    case .finished:
//        print("finished")
//    case .failure(let error):
//        print(error.localizedDescription)
//    }
//} receiveValue: { value in
//    print("subscriber2:", value)
//}
//
//passthroughSubject.send(3)
//passthroughSubject.send(5)
//subscriber1.cancel()
//passthroughSubject.send(7)

let passthroughSubject = PassthroughSubject<Int, Never>()
let subscriber = passthroughSubject
    .receive(on: DispatchQueue.main)
    .sink { value in
    print(Thread.isMainThread)
    print(value)
}
passthroughSubject.send(3)
DispatchQueue.global().async {
    passthroughSubject.send(5)
}



// Prints:
//  value: initial value.
//  value: second value.
//  The process then terminates in the debugger as the assertNoFailure operator catches the genericSubjectError.
