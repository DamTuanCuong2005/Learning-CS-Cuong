import Foundation
let prices = [10.0, 25.5, 4.5]
func totalPrice(of prices: [Double], taxRate: Double = 0.1, discount: Double = 0) -> Double{
    guard !prices.isEmpty else{return 0.0}
    var total:Double = 0
    var lai:Double = 0
    for price in prices{
        total += Double(price)
        lai = (total*taxRate)
        if lai < 0{
            return 0.0
        }
    }
    if discount < 0{
        return 0.0
    }
    return total + lai - discount
}
print(totalPrice(of: prices))
