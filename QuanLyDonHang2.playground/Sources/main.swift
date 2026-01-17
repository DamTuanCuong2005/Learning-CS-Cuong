struct app{
    func main() {
        let user1 = [
            User(id: 21, name: "Đàm Tuấn Cường", isActive: true),
            User(id: 11, name: "Đàm Vĩnh Hưng", isActive: false),
            User(id: 31, name: "Nguyễn Hữu Thọ", isActive: true)
        ]
        
        let product1 = [
            Product(id: 21, name: "Ao", price: 200),
            Product(id: 20, name: "Quan", price: 100),
            Product(id: 33, name: "Tất", price: 300)
        ]
        
        let order1 = [
            Order(orderId: 21, userId: 21, products: product1),
            Order(orderId: 20, userId: 20, products: product1),
            Order(orderId: 33, userId: 33, products: [])
        ]
        
        print(CheckUserStatus(user: user1, userId: 21).message)
    }
}
app().main()
