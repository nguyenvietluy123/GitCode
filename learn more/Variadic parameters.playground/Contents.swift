//: Playground - noun: a place where people can play

import UIKit

func sum(_ args: Int...) -> Int {
    var result = 0
    
    for a in args {
        result += a
    }
    return result
}

sum(1,2,3,4,5)



