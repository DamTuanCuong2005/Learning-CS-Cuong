enum TotalPriceStatus{
    case priceInvalid
    case priceOK
    
    var message: String{
        switch self{
        case .priceInvalid:
            return "Số tiền không hợp lệ"
        case .priceOK:
            return "Số tiền hợp lệ"
        }
    }
}
