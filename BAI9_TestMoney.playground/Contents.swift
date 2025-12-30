import UIKit
func validatePrice(_ text: String?){
    guard let text = text,text.isEmpty == false else {
        print("Chưa nhập giá")
        return
    }
    guard let price = Double(text) else {
        print("Giá không hợp lệ")
        return
    }
    guard price >= 0 else {
        print("Giá phải lớn hơn 0")
        return
    }
    print("Giá hợp lệ: \(text) Vnđ")
}
print(validatePrice("100.000"))
