enum OrderStatus{
    case orderEmpty
    case orderValid
    
    var message: String{
        switch self{
        case .orderEmpty:
            return "Rỗng"
        case .orderValid:
            return "Order Valid"
        }
    }
}
