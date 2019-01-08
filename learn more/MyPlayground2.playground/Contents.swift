//: Playground - noun: a place where people can play

import UIKit

class Person{
    private var lover: UInt = 0
    private var sex: Bool
    private var currencyHoney: String = ""
    private var skin: UIColor
    private var liked: UInt = 0
    var name: String
    var age: UInt = 1
    var isLearningSwift: Bool = false
    
    init(name: String, sex: Bool, skin: UIColor) {
        self.name = name
        self.sex = sex
        self.skin = skin
    }
    
    func eat(something: String){
        print("now i eat \(something) good")
    }
    
    private func love(someOne: Person){
        self.currencyHoney = someOne.name
    }
    
    func like(someOne: Person){
        liked += 1
        if liked >= 3 {
            love(someOne: someOne)
        }
    }
    
    func statusOfLove() -> String {
        if self.currencyHoney == ""{
            return ("i am lonely")
        }else{
            return ("i am fall in love with \(currencyHoney)")
        }
    }
}
var nam = Person(name: "Nam", sex: true, skin: .black)
var nu = Person(name: "Loan", sex: false, skin: .white)

nam.like(someOne: nu)
nam.statusOfLove()
nam.like(someOne: nu)
nam.like(someOne: nu)
nam.statusOfLove()


