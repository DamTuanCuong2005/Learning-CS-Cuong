import UIKit
var Array: [Int]=[1,3,2,7,6]
Array.append(4)
Array.remove(at: 2)
Array[0] = 5
print(Array)
print(Array.first!)
print(Array.last!)
print(Array.randomElement()!)
var set: Set<String> = ["abc","abd","acb"]
set.insert("def")
print(set)
set.remove("abc")
print(set)

