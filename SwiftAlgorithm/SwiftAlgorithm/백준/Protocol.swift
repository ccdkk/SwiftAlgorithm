//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/6/23.
//

import Foundation


class PCRoom {
    let member: Person
    
    init(member: Person) {
        self.member = member
    }
    
    func whoIsIt() {
        print(member.name + " go to PC")
    }
}

class Person {
    let name: String
    init(name: String) {
        self.name = name
    }
}

let dake = Person(name: "Dake")
let levelPC = PCRoom(member: dake)

//protocol PCMemeber {
//    func whichPCRoom()
//}
//
//class PCRoom {
//    let member: PCMemeber
//    
//    init(member: PCMemeber) {
//        self.member = member
//    }
//    
//    func whoIsIt() {
//        member.whichPCRoom()
//    }
//}

//class Person: PCMemeber {
//    let name: String
//    
//    init(name: String) {
//        self.name = name
//    }
//    
//    func whichPCRoom() {
//        print(name + " go to PC")
//    }
//}
//
//let dake = Person(name: "Dake")
//let terry = Person(name: "Terry")
//let levelPCRoom = PCRoom(member: dake)
//levelPCRoom.whoIsIt()

