import UIKit
struct Car{
    let id:Int
    let type:String
    let name:String
    var color:String
}
struct TypeCar{
    let id:Int
    let name:String
    let numberOfWheels:Int
}
let ArrayTypeCar:[TypeCar] = [
    TypeCar(id:1,name:"Sedan",numberOfWheels: 4),
    TypeCar(id:2,name:"SUV",numberOfWheels: 4),
    TypeCar(id:3,name:"Truck",numberOfWheels: 6)
]
//Tao danh sach xe in ra ten,mau,soluongbanhxe
let ArrayCar:[Car] = [
    Car(id:1, type: "Car A",name:"Sedan",color: "Red"),
    Car(id:2, type: "Car B",name:"Sedan",color: "Black"),
    Car(id:3,type: "Car C",name:"SUV",color: "Red"),
    Car(id:4,type: "Car D",name:"SUV",color: "White"),
    Car(id:5,type: "Car E",name:"Truck",color: "Black"),
    Car(id:6,type: "Car F",name:"Truck",color: "Red")
]
//in ten xe-loai xe-mau xe-so banh xe
for car in ArrayCar{
    if let typeCar = ArrayTypeCar.first(where: {$0.name == car.name}){
        print("Name: \(car.name),Type: \(car.type),Color:\(car.color),Wheel:\(typeCar.numberOfWheels))")
    }
}
// Lọc ra xe màu đỏ và 4 bánh
for car in ArrayCar{
    if let typeCar = ArrayTypeCar.first(where: {$0.name == car.name}),typeCar.numberOfWheels == 4 && car.color == "Red"{
        print(car)
    }
}
//Tao 1 mang moi chi chua ten trong danh sach ban dau
print(ArrayCar.map(\.name))
//tao Set in ra so luong xe trong danh sach
print(Set(ArrayCar.map(\.name)).count)
//in ra kết quả true hoặc false
for car in ArrayCar{
    if let typeCar = ArrayTypeCar.first(where: {$0.name == car.name}),car.name == "SUV",typeCar.numberOfWheels == 4{
        print("true")
    }else{
        print("False")
    }
}
//In ra danh sách co cac xe cung mau
var Dictionary: [String:String] = [:]
for car in ArrayCar{
    if Dictionary[car.color] == nil{
        Dictionary[car.color] = car.name
    }else{
        Dictionary[car.color]! += ",\(car.name)"
    }
}
print(Dictionary)
//đếm số lượng màu
var DictionaryColor: [String:Int]=[:]
for car in ArrayCar{
    DictionaryColor[car.color,default: 0] += 1
}
print(DictionaryColor)
//1. hàm. để lấy danh sách các xe theo loại xe
for car in ArrayCar{
    if car.name == "Truck"{
        print(car)
    }
}
print("/////////////////////////////////////////////////")
//Tìm xe có số bánh nhìu nhất trong danh sách,Có nhiều xe có số bánh lớn nhất chỉ lấy 1 xe
var Dictionary2: [String:Int] = [:]
for car in ArrayCar{
    if let typeCar = ArrayTypeCar.first(where: {$0.name == car.name}){
        Dictionary2[car.name]=typeCar.numberOfWheels
    }
}
if let max = Dictionary2.max(by: {$0.value < $1.value}){
    print(max)
}
var Dictionary5: [String:[String:String]] = [:]
for car in ArrayCar{
    Dictionary5[car.name] = [car.color:car.type]
}
print(Dictionary5)
//In báo. cáo xe
var Dictionary3: [String:Int] = [:]
for car in ArrayCar{
    Dictionary3[car.name, default: 0] += 1
}
print(Dictionary3)
//Kiểm tra dữ liệu có hợp lệ không
for car in ArrayCar{
    if let typeCar = ArrayTypeCar.first(where: {$0.name == car.name}){
        print(ArrayCar.contains(where: {$0.id == car.id}),ArrayTypeCar.contains(where: {$0.numberOfWheels > 0}))
    }
}
//thêm 1 loại. xe mói
var typecar = ArrayTypeCar
typecar += [TypeCar(id: 4,name: "vinfast", numberOfWheels: 2)]
typecar += [TypeCar(id: 5,name:"Vespa",numberOfWheels: 2)]
for typecar in typecar{
    print("Id: \(typecar.id),name: \(typecar.name),numberOfWheels: \(typecar.numberOfWheels)")
}
