func searchOrderByProductName(
keyword: String?,
 orders: [Order]
) -> SearchOrderStatus{
    guard let key = keyword,!key.isEmpty else{
        return .emptyKeyword
    }
    let keylowercase = key.lowercased()
    for order in orders {
        for product in order.products{
            if product.name.lowercased().contains(keylowercase){
                return .found
            }
        }
    }
    return .notFound
}
