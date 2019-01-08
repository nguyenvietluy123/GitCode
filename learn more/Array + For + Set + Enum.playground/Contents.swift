//: Playground - noun: a place where people can play

import UIKit

//var someArray = [Int]()
//
//var repeatArray = [Int](repeating: 1, count: 5)
//
//var newArray = Array(repeating: 1, count: 3)

//var othersArray: [Int] = [10, 20, 30]
//
//let index = 3
//
//var number = othersArray[index]

/*
var someInts = [Int]()

someInts.append(20)
someInts.append(30)
someInts += [40]

var someVar = someInts[0]

var newInts = someInts

someInts.append(50)

print(newInts)
*/

/*
var intsArray:[Int] = [10, 20, 30]

intsArray.count
intsArray.remove(at: 1)

intsArray.removeAll()
intsArray.isEmpty
intsArray.count

print(intsArray)
for number in intsArray {
    print(number)
}
 
 for (index, names) in stringArray.enumerated()   //enumerated(liệt kê)
 {
 print("page \(index) name is \(names)")
 }

 */

/*
//adding 2 array
var int1 = [Int](repeating: 2, count: 3)
var int2 = [Int](repeating: 4, count: 2)
var add = int1 + int2
print(add)
*/

/*
var someSet = Set<Int>()

someSet.insert(1)

print(someSet)

someSet.insert(2)

print(someSet)

someSet.insert(3)

print(someSet)

someSet.capacity

someSet.remove(2)

print(someSet)
 
for sort in someSet.sorted()
 {
 print(sort)
 }
 
let isContain = someSet.contains(2)
 
 //Intersection: giao
 Union: hợp
 subtracting: trừ
 
 let evens: Set = [10,12,14,16,18]
 let odds: Set = [5,7,9,11,13]
 let primes = [2,3,5,7]
 odds.union(evens).sorted()
 // [5,7,9,10,11,12,13,14,16,18]
 odds.intersection(evens).sorted()
 //[]
 odds.subtracting(primes).sorted()
 //[3,4,4,4,13]
*/

enum names : String {
    case Closures = "aaa"
    case Swift = "bbb"
    case OjectiveC = "ccc"
}

var lang = names.Closures
print(lang.rawValue)

lang = .Swift
print(lang.rawValue)

switch lang {
case .Swift:
    print("welcome to swift")
case .Closures:
    print("welcome to closures")
default:
    print("welcome to objective-c")
}

























