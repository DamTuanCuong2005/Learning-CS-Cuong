func validateOrder(order: Order?) -> OrderStatus{
    guard let order = order,!(order.products).isEmpty else{
        return .orderEmpty
    }
    return .orderValid
}
