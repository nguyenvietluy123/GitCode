//: Playground - noun: a place where people can play

import UIKit
//
//var str  "Hello, playground"
//let names = ["Sasha", "Oliver", "Bill", "Nguyen", "ALex"]
//
//let number = [1,2,3,4,5]
//
//
//func sort(_ s1: String,_ s2: String) -> Bool {
//    return s1 > s2
//}
//
//var reserveNames = names.sorted(by: sort)
//reserveNames = names.sorted(by: {(s1: String, s2: String) -> Bool in return s1 > s2})
//
//reserveNames = names.sorted(by: {s1, s2  in return s1 > s2})
//
//reserveNames = names.sorted(by: {s1, s2  in s1 > s2})
//
//reserveNames = names.sorted(by: { $0 > $1 } )
//
//print(reserveNames)
//

let number = [1,4,5,2,6,4]

func sort(s1: Int, s2: Int) -> Bool {
    return s1 > s2
}

var sortNumber = number.sorted(by: {(s1: Int, s2: Int) -> Bool in return s1 < s2})

sortNumber = number.sorted(by: sort)

print(sortNumber)
