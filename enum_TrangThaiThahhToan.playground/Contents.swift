import Foundation

enum PaymentStatus{
    case idle
    case proccessing
    case success
    case failed(reason: String)
}
func paymentStatusMessage(stage: PaymentStatus){
    switch stage{
    case .idle:
        print("Chờ...")
    case .proccessing:
        print("Đang xử lý")
    case .success:
        print("Xử lý thành công")
    case .failed(let reason):
        print("Xử lý thất bại do: \(reason)")
    }
}
paymentStatusMessage(stage: .idle)
paymentStatusMessage(stage: .proccessing)
paymentStatusMessage(stage: .failed(reason: "Nhập giá dưới 10.000đ"))
