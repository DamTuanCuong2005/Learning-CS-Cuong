struct PaymentService{
    func payment(TotalPrice: Double?) -> PaymentStatus{
        guard let total = TotalPrice,total >= 0 else{
            return .paymentInvalid
        }
        guard total <= 1_000_000 else{
            return .paymentFailed
        }
        return .paymentSuccess
    }
}
