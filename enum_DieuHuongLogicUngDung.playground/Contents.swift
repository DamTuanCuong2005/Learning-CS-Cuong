import Foundation
enum Route{
    case home
    case productDetail(productId: Int)
    case cart
    case checkout(isLoggedIn: Bool)
    case login
}
func resolveRoute(route: Route){
    switch route{
    case .home:
        print("Trang chủ")
    case .productDetail(let productId):
        print("Tên mã sản phẩm: \(productId)")
    case .cart:
        print("Thêm vào Giỏ hàng")
    case .checkout(let isLoggedIn):
        if isLoggedIn == true{
            print("Đăng nhập thành công")
        }
        if isLoggedIn == false{
            print("Đăng nhập thất bại")
        }
    case .login:
        print("Đã Đăng Nhập vào tài khoản")
    }
}
resolveRoute(route: .checkout(isLoggedIn: true))
resolveRoute(route: .login)
resolveRoute(route: .home)
resolveRoute(route: .productDetail(productId: 1))
resolveRoute(route: .cart)

