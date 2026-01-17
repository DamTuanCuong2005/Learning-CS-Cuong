import Foundation

struct User{
    let id: Int
    let name: String
    let isActive: Bool
}

struct Product{
    let id: Int
    let name: String
    let price: Double
}

struct Order{
    let orderId: Int
    let userId: Int
    let products: [Product]
}

enum UserStatus{
    case userNotFound(message: String)
    case userInactive(message: String)
    case userActive(message: String)
}

enum OrderStatus{
    case orderEmpty(message: String)
    case orderValid(message: String)
}

enum TotalPriceStatus{
    case priceInvalid(message: String)
    case priceOk(message: String)
}

enum PaymentStatus{
    case paymentSuccess
    case paymentFailed(message: String)
    case paymentInvalid(message: String)
}

func paymentstatus(payment: PaymentStatus){
    switch payment{
        
    case .paymentSuccess:
        print("Thanh toán thành công")
    case .paymentFailed(message: let message):
        print("Thanh toán thất bại lý do: \(message)")
    case .paymentInvalid(message: let message):
        print("Thanh toán Không hợp lệ: \(message)")
    }
}

enum SearchOrderStatus{
    case emptyKeyword(message: String)
    case found(message: String)
    case notFound(message: String)
}
func checkUserStatus(users: [User],UserId:Int?) -> UserStatus{
    guard let user = users.first(where: {$0.id == UserId}) else{
        return .userNotFound(message: "Không tim thầy User")
    }
    return user.isActive ? .userActive(message: "Đã tìm thấy User"): .userInactive(message: "Chưa tìm thấy user")
}

func validateOrder(order:Order?) -> OrderStatus{
    guard let Order = order,(Order.products).isEmpty else{
        return .orderValid(message: "Order valid")
    }
    return .orderEmpty(message: "Rỗng")
}

func CaculatotTotalPrice(
    product: [Product],
    onResult: (TotalPriceStatus, Double?) -> Void
){
    let price = product.map(\.price)
    if price.contains(where: {$0 < 0}){
        onResult(.priceInvalid(message: "Thanh toán Không thành công"), nil)
    }
    let total = price.reduce(0, +)
    onResult(.priceOk(message: "Thanh toán thành công"), total)
}

func Payment(totalPrice: Double?) -> PaymentStatus{
    guard let total = totalPrice,total >= 0 else{
        return .paymentInvalid(message: "Số tiền quá ít hoặc không đủ ")
    }
    if total <= 1000000{
        return .paymentSuccess
    }else{
        return .paymentFailed(message: "Đơn hàng vượt quá số tiền")
    }
}

func searchOrderByProductName(Keyword: String?, ordets: [Order]) -> SearchOrderStatus{
    let key = Keyword?.trimmingCharacters(in: .whitespacesAndNewlines)
    guard let keyword = key, !keyword.isEmpty else{
        return .emptyKeyword(message: "Rỗng hoặc không thấy")
    }
    let lowerKeyword = keyword.lowercased()
    for ordet in ordets {
        for product in ordet.products {
            if product.name.lowercased().contains(lowerKeyword){
                return.found(message: "Đã tìm thấy")
            }
        }
    }
    return .notFound(message: "Không tìm thấy")
}

enum Screen{
    case login
    case orderList
    case orderDeail
    case payment
}

struct UiState{
    let screen: Screen
    let status: String
    let message: String
}

func UIStatus(Search: SearchOrderStatus)-> UiState{
    switch Search{
    case .emptyKeyword(let message):
        return UiState(screen: .orderList, status: "error", message: message)
    case .found(message: let message):
        return UiState(screen: .orderDeail, status: "Success", message: message)
    case .notFound(message: let message):
        return UiState(screen: .orderList, status: "empty", message: message)
    }
}

let User1 = [User(id: 21, name: "Đàm Tuấn Cường", isActive: true),User(id: 11, name: "Đàm Vĩnh Hưng", isActive: false),User(id: 31, name: "Nguyễn Hữu Thọ", isActive: true)]

let product1 = [Product(id: 21, name: "Ao", price: 200),Product(id: 20, name: "Quan", price: 100),Product(id: 33, name: "Tất", price: 300)]

let order1 = [Order(orderId: 21, userId: 21, products: product1),Order(orderId: 20, userId: 20, products: product1),Order(orderId: 33, userId: 33, products: [])]

print(checkUserStatus(users: User1, UserId: 20))

print(validateOrder(order: order1.first))

CaculatotTotalPrice(product: product1){status,total in
    print(status.self)
    let paymentStatus = Payment(totalPrice: total)
    print(paymentStatus.self)
}

print(validateOrder(order: order1.last))

print(Payment(totalPrice: -1))

print(Payment(totalPrice: 1000000000000))

print(searchOrderByProductName(Keyword: "", ordets: order1))

print(searchOrderByProductName(Keyword: "ao", ordets: order1))

