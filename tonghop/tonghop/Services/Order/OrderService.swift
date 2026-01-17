struct OrderService{
    func validateOrder(order: Order?) -> OrderStatus{
        guard let ord = order,!(ord.product).isEmpty else{
            return .orderValid
        }
        return .orderEmpty
    }

}
