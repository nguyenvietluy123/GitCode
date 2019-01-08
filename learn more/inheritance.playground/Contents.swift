//: Playground - noun: a place where people can play

import UIKit

class Gibbon {
    var height: UInt = 1
    var weight: UInt = 1
    func eat(_ something: String, gain: inout Int)
    {
        gain = gain + 1
        print("gibbon eat \(something) and gain \(gain)")
    }
    
    func dance(_ other: String?) -> String {
        guard other == "gozilla" else {
            return "not dance"
        }
        return ("gibbon dance with gozilla")
    }
}
var gib1 = Gibbon()

gib1.dance("gozilla")
