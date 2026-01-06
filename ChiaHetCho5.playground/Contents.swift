import Foundation
for i in 1...10{
    if (i % 5 != 0) {
        print(i)
    }
}

func greet(_ name:String){
    print("Hello \(name)")
}
greet("An")
greet("Binh")

func square(_ numbers:Int)-> Int{
    var total = numbers * numbers
    print(total)
    return total
}
square(4)
square(8)
