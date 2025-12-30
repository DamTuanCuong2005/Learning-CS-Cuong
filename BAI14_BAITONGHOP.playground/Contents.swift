import UIKit
func processAddToCart(
 sku: String?,
 name: String?,
 priceText: String?,
 quantityText: String?,
 cart: inout [String: Int]
){
    guard let sku, let name, let priceText, let quantityText else { return }
    let quantity = Int(quantityText) ?? 0
    cart[sku, default: 0] += quantity
    guard let price = Double(priceText) else {
        print("Không thể phân tích giá từ: \(priceText). ")
        return
    }
    guard quantity > 0 else {
        print("Số lượng phải lớn hơn 0.")
        return
    }
    guard let index = cart.firstIndex(where: { $0.key == sku }) else {
        print("Không thể tìm thấy sản phẩm \(name) trong giỏ hàng.")
        return
    }
    print("Đã thêm thành công \(sku) - \(name)")
}
var cart: [String: Int] = [:]
print(processAddToCart(sku: "SKU-123", name: "Iphone 12", priceText: "10000000", quantityText: "3", cart: &cart))
