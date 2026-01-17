func CheckUserStatus(user: [User],userId: Int) -> UserStatus{
    guard user.contains(where: {$0.id == userId}) else{
        return .userNotFound
    }
    guard user.contains(where: {$0.isActive}) else{
        return .userInactive
    }
    return .userActive
}
