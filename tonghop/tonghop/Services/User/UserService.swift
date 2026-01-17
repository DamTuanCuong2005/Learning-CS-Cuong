struct UserService{
    func CheckUserStatus(user: [User], userId: Int) -> UserStatus{
        guard user.contains(where: {$0.id == userId}) else{
            return .userNotFound
        }
        guard user.contains(where: {$0.isActive == false}) else{
            return .userActive
        }
        return .userInactive
    }
}
