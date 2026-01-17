enum UserStatus{
    case userNotFound
    case userInactive
    case userActive
    
    var message: String{
        switch self{
        case .userActive:
            return "Người dùng đang hoạt động"
        case .userNotFound:
            return "Người dùng không tìm thấy"
        case .userInactive:
            return "Người dùng không hoạt động"
        }
    }
}
