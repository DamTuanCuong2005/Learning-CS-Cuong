import Foundation
let prices = [10.0, 25.5, 4.5]
func totalPrice(of prices: [Double], taxRate: Double = 0.1, discount: Double = 0) -> Double{
    var total = Double()
    var sale:Double = 0
    for price in prices{
        total += Double(price)
        sale = total*taxRate-discount
    }
    return total + sale
}
print(totalPrice(of: prices))
