import Foundation
enum ShippingMethod{
    case standard
    case express
    case sameDay(distanceKm: Int)
}
func calculateShippingFee(method:ShippingMethod,orderAmount:Double) -> Double{
    if orderAmount >= 1000000{
        return 0
    }
    switch method{
    case .standard:
        return 20000 + orderAmount
        
    case .express:
        return 30000 + orderAmount
        
    case .sameDay(let distanceKm):
        if distanceKm <= 5 {
            return 50000 + orderAmount
        } else {
            let extraDistance = distanceKm - 5
            return (50000 + Double(extraDistance) * 5000) + orderAmount
        }
    }
}
print(calculateShippingFee(method: .sameDay(distanceKm: 8), orderAmount: 220000))
