func calculateTotalPrice(
    product: [Product],
    onResult: (TotalPriceStatus, Double?) -> Void
){
    let price = product.map(\.price)
    if price.contains(where: {$0 < 0}){
        return onResult(.priceInvalid, nil)
    }
    let total = price.reduce(0, +)
    onResult(.priceOK, total)
}
