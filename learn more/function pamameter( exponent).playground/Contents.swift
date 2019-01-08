    //: Playground - noun: a place where people can play

import UIKit

func power(base a: Int, exponent b: Int) -> Int {
    var result = a
    for _ in 1..<b {
        result = result * a
    }
    return result
}

power(base: 2, exponent: 3)
