import UIKit
//var a:String="""
//Hôm nay thứ 3
//Học bài 1 basic syntax
//"""
//var b:Int=10
//var c:String="Hôm nay thứ \(b) tại day"
//print(a)
//print(c)
//var n:Int=65
//var m:Array<Int> = Array(1...10)
//
//var array: [Int] = [1,2,3,4,5,6]
//print( n % 3 == 0 ? "Yes" : "No")
////if(Arr%3==0){
////    print( "Yes")
////}else {
////    print( "No")
////}
//for index in 1...6 {
//    print (index)
//}
var a: [String] = ["Cường", "Tuấn", "Hải", "Vinh","Hoàng"]
for name in a {
    print(a[0])
}
struct User {
    let id: Int
    let name: String
    var age: Int
}
var arrayUser: [User] = [User(id:2001,name:"Cường",age:18),User(id: 2002, name: "Tuấn", age: 18),User(id: 2003, name: "Hải", age: 18),User(id: 2005, name: "Vinh", age: 19),User(id: 2006, name: "Hoàng", age: 22)]
for index in arrayUser {
    print(index.age <= 18 ? index.name : "")
}
