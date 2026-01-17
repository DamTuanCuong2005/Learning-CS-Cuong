enum PaymentStatus{
    case paymentSuccess
    case paymentFailed
    case paymentInvalid
    
    var message: String{
        switch self{
        case .paymentFailed:
            return "Thanh toán Thất bại"
        case .paymentInvalid:
            return "Thanh toán không hợp lệ"
        case .paymentSuccess:
            return "Thanh toán thành công"
        }
    }
}
