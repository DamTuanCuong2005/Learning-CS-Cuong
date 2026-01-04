import Foundation
let prices = [10.0, 25.5, 4.5]
func totalPrice(of prices: [Double], taxRate: Double = 0.1, discount: Double = 0) -> Double {
    let pricesWithTax = prices.map { $0 * (1 + taxRate) }
    let total = pricesWithTax.reduce(0, +) - discount
    return total
}
print(totalPrice(of: prices))
