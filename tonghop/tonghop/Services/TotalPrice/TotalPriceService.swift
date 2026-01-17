struct TotalPriceService{
    
    func caculatorTotalPrice(
        products: [Product],
        onResult: (TotalPriceStatus, Double?) -> Void
    ){
        let price = products.map(\.price)
        
        if price.contains(where: {$0 < 0}){
            return onResult(.priceInvalid, nil)
        }
        
        let total = price.reduce(0, +)
        return onResult(.priceOK, total)
        
    }
}
