import Foundation
enum OrderStatus{
    case created
    case paid
    case shipping
    case delivered
    case cancelled(reason:String)
}
func orderStatusDescription(status: OrderStatus){
    switch status{
    case .created:
        print("Tạo thành công")
    case .paid:
        print("Đã Trả tiền")
    case .shipping:
        print("Đang vận chuyển")
    case .delivered:
        print("Đã Giao Hàng")
    case .cancelled(let reason):
        print("Lý do: \(reason)")
    }
}
orderStatusDescription(status: .created)
orderStatusDescription(status: .paid)
orderStatusDescription(status: .shipping)
orderStatusDescription(status: .delivered)
