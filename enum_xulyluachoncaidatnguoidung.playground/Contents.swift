import Foundation

enum SettingAction{
    case profile
    case notification
    case appearance
    case help
    case logout
}
func handleSettingActon(action: SettingAction){
    switch action{
    case .profile:
        print("Người dùng đã vào Trang cá nhân")
    case .notification:
        print("Người dùng đã vào mục Tất cả Thông báo")
    case .appearance:
        print("Người dùng đã vào Bố cục")
    case .help:
        print("Người dùng đã vào mục Trợ giúp")
    case .logout:
        print("Người dùng đã Đăng xuất khỏi tài khoản")
    }
}
handleSettingActon(action: .profile)
handleSettingActon(action: .notification)
handleSettingActon(action: .appearance)
handleSettingActon(action: .help)
handleSettingActon(action: .logout)
