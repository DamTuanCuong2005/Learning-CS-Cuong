import Foundation
struct Car{
    let id:Int
    var brand:String
    let color:String
}
var CarName:[Car] = [Car(id: 2001, brand: "Toyota",color:"red"),Car(id: 2002, brand: "Honda", color: "Blue"),Car(id: 2003, brand: "BMW", color: "Black"),Car(id: 2004, brand: "Vinfast", color: "Blue")]
for car in CarName {
    print(car.color == "Blue" ? car.brand:"" )
}
