import Foundation

struct Product{
    let name:String
    var price:Double
}

protocol Priable{
    var price:Double { get }
}

extension Priable{
    func printResult(precent:Double) -> Double{
        return price * (1 - precent/100)
    }
}

func SumProduct(of product:[Priable]) -> Double{
    var prd:Product
    var sum:Double = 0
    sum += prd.price
    return sum
}
let p1 = Product(name: "Áo Palo", price: 100)
let p2 = Product(name: "Áo Dây Thun", price: 200)
let p3 = Product(name: "Quần dài", price: 90)
let p4 = Product(name: "Quần ngắn", price: 250)

