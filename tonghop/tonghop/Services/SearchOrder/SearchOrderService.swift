struct SearchOrderService{
    func searchOrderByProductName(keyword: String?,orders: [Order]) -> SearchOrderStatus{
        guard let key = keyword,!key.isEmpty else{
            return .emptyKeyWord
        }
        let keylowercase = key.lowercased()
        for ord in orders{
            for prd in ord.product{
                if prd.name.lowercased().contains(keylowercase){
                    return .found
                }
            }
        }
        return .notFound
    }
}
