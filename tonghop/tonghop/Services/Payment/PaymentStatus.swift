enum PaymentStatus{
    case paymentSuccess
    case paymentFailed
    case paymentInvalid
    
    var message: String{
        switch self{
        case .paymentFailed:
            return "Thanh toán thất bại"
        case .paymentSuccess:
            return "Thanh toán Thành công "
        case .paymentInvalid:
            return "Thanh toán không được"
        }
    }
}
