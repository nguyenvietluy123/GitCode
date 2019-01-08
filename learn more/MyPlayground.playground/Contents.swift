//: Playground - noun: a place where people can play

import UIKit

class Dog{
    var color: String
    private var name: String
    var legs:UInt
    init(color: String, name: String){
        self.color = color
        self.name = name
        self.legs = 0
    }
    func eat(meat: String){
        print(meat)
    }
    func changeColor(newColor: String) -> (String, UInt){
        self.color = newColor + self.name
        return ("something" + self.color, 1)
    }
    func getName() -> (String){
        return self.name
    }
}

var redDog = Dog(color: "black", name: "Pull")
print(redDog.color)

print(redDog.changeColor(newColor: "blue").0)

print(redDog.getName())

