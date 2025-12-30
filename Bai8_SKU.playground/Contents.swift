import UIKit
func validateSKU(_ sku: String?){
    guard let sku = sku else {
        print( "Chưa nhập mã sản phẩm")
        return
    }
    guard sku.isEmpty == false else {
        print("Rỗng")
        return
    }
    guard sku.hasPrefix("SKU-") else {
            print("Sai Định Dạng SKU")
            return
        }
        print("SKU hợp lệ:\(sku)")
    }
print(validateSKU("SKU-12345"))
