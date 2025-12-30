import UIKit
func calcTotal(priceText: String?, quantityText: String?){
    guard let priceText, let quantityText else {
        return
    }
    guard let price = Double(priceText), let quantity = Int(quantityText) else {
        return
    }
    guard quantity >= 0 else {
        print("Số lượng không hợp lệ")
        return
    }
    let total = price * Double(quantity)
    print("Thành Tiền:\(total)")
}
print(calcTotal(priceText: "10", quantityText: "5"))
