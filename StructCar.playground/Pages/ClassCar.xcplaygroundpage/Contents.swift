import Foundation
class Car {
    let id:Int
    var brand:String
    let color:String
    init(id:Int,brand:String,color:String) {
        self.id = id
        self.brand = brand
        self.color = color
    }
}
var cars:[Car] = [Car(id: 2001, brand: "Toyota",color:"red"),Car(id: 2002, brand: "Honda", color: "Blue"),Car(id: 2003, brand: "BMW", color: "Black")]
for car in cars{
    print(car.color == "Blue" ? car.brand:"")
}
