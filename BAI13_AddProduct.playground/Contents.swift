import UIKit
var cart: [String: Int] = ["SKU-001": 1]
let priceList: [String: Double] = [
 "SKU-001": 120000,
 "SKU-002": 99000
]
func addToCart(
 sku: String?,
 quantityText: String?,
 cart: inout [String: Int],
 priceList: [String: Double]
) {
    guard priceList[sku!] != nil else {
        print("Sku ko tồn tại trong list")
        return
    }
    guard let quantity = Int(quantityText ?? "0") else {
        print("Số lượng không hợp lệ")
        return
    }
    cart[sku!, default: 0] += quantity
    print("Đã thêm \(sku!)-SL:\(quantity)")
}
print(addToCart(sku: "SKU-001", quantityText: "3", cart: &cart, priceList: priceList))
