import Foundation
//in 1 - 10
print("Bai 1")
func bai1(){
    for i in 1...10{
        print("\(i)")
    }
}
//Tổng mảng
print("Bai 2")
func bai2(){
    let number = [1,2,3,4,5]
    var total:Int = 0
    for i in number{
        total += i
    }
    print(total)
}
//in so le
print("Bai 3")
func bai3(){
    for i in 1...10{
        if i % 2 == 0{
            continue
        }
        print(i)
    }
}
//dùng hàm in tên
print("Bai 4")
func greet(_ name:String){
    print("Hello \(name)")
}
greet("An")
greet("Binh")
//hàm bình phương
print("Bai 5")
func square(_ number:Int)->Int{
    number * number
}
square(4)
square(7)
//Default parameter easy
print("Bài 6")
func greet(name:String = "Guest"){
    print("Hello \(name)")
}
greet()
greet("An")
//Variadic easy
print("Bai 7")
func printNumber(_ numbers:Int...){
    for i in numbers{
        print("\(i)")
    }
}
printNumber(1,2,3)
//Throw number
print("Bai 8")
enum NumberError: Error{
    case ValidNumber
    case InvalidNumber
}
func NumberToThrow(_ numbers:Int) throws {
    if numbers < 0{
        throw NumberError.ValidNumber
    }
    if numbers == numbers{
        throw NumberError.InvalidNumber
    }
}
do{
    try NumberToThrow(2)
}catch NumberError.ValidNumber{
    print("Lỗi số")
}catch NumberError.InvalidNumber{
    print("Số hợp lệ")
}
//Reset số
print("Bai 9")
func resetScore(_ score: inout Int){
    score = 0
}
var score = 10
resetScore(&score)
print(score)
