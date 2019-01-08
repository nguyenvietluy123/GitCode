import UIKit

//func filterGreaterThanValue(value: Int, numbers: [Int]) -> [Int] {
//    var filterNumbers = [Int]()
//
//    for num in numbers {
//        if value < num {
//            filterNumbers.append(num)
//        }
//    }
//
//    return filterNumbers
//}
//
//
//var filteredList = filterGreaterThanValue(value: 3, numbers: [1,2,5,7,9,10])
//print(filteredList)


func filterGreaterThanValue(closure: (Int) -> Bool, numbers: [Int]) -> [Int] {
    var filterNumbers = [Int]()
    
    for num in numbers {
        if closure(num) {
            filterNumbers.append(num)
        }
    }
    
    return filterNumbers
}

func greaterThanThree(value: Int) -> Bool {
    return value > 3
}

//var filteredList = filterGreaterThanValue(closure: { (num) -> Bool in
//    return num < 5
//}, numbers: [1,2,3,5,7,10])

var filteredList = filterGreaterThanValue(closure: greaterThanThree, numbers: [1, 2, 3, 5, 7, 10])
print(filteredList)
