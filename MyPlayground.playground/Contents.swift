//: Playground - noun: a place where people can play

import UIKit

//var str = "Hello, playground"
var values = [2,4,5,7,8,9]

var test = [4,2,5]

let a = values.filter { (i) -> Bool in
    test.contains(i)
}
print("----\(a)")
//let squares = values.filter { $0 > 3 }
//print(squares)

//values.enumerate().flatMap{ $0.index < 1000 ? $0.element : nil }


//extension Array {
//    func takeElements(elementCount: Int) -> Array {
//        if (elementCount > count) {
//            return Array(self[0..<count])
//        }
//        return Array(self[0..<elementCount])
//    }
//}
