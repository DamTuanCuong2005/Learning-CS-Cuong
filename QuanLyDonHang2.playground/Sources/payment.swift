func payment(totalPrice: Double?) -> PaymentStatus{
    if let total = totalPrice,total <= 0{
        return .paymentInvalid
    }
    guard let total = totalPrice,total <= 1_000_000 else{
        return .paymentSuccess
    }
    return .paymentFailed
}
