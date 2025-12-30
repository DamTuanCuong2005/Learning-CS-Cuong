import UIKit
struct Product {
 let sku: String
 let name: String
 let price: Double
}
func createProduct(
 sku: String?,
 name: String?,
 priceText: String?
) -> Product? {
    guard let sku = sku, sku.isEmpty == false else {
        print("SKu không được để trống")
        return nil
    }
    guard let name=name,name.isEmpty==false else {
        print("Tên không được để trống")
        return nil
    }
    guard sku.hasPrefix("SKU-") else {
        print("SKU đúng định dạng là 'SKU-'")
        return nil
    }
    guard let priceText, let price = Double(priceText) else {
        print("Giá không hợp lệ")
        return nil
    }
    guard price > 0 else {
        print("Giá phải lớn hơn 0")
        return nil
    }
    guard sku == sku,name == name,priceText == priceText else {
        print("Gặp lỗi khi tạo sản phẩm")
        return nil
    }
    return Product(sku: sku, name: name, price: Double(priceText)!)
}
print(createProduct(sku: "SKU-001", name: "Iphone 12", priceText: "2000000")!)
