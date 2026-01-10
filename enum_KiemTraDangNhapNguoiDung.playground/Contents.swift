import Foundation
enum LoginError{
    case emptyUsername
    case emptyPassword
    case passwordTooShot
    case invalidCredential
}
enum LoginResult{
    case success(message: String)
    case failure(error: LoginError)
}
func login(username:String?, password:String?) -> LoginResult{
    guard let username = username,!username.isEmpty else{
        return .failure(error: .emptyUsername)
    }
    guard let password = password,!password.isEmpty else{
        return .failure(error: .emptyPassword)
    }
    guard password.count >= 6 else{
        return .failure(error: .passwordTooShot)
    }
    return .success(message: "Thành công")
}
func loginErrorMessage(error: LoginError){
    switch error{
    case .emptyUsername:
        print("Username Trống")
    case .emptyPassword:
        print("Password Trống")
    case .passwordTooShot:
        print("Password quá ngắn")
    case .invalidCredential:
        print("Thông tin đăng nhập không hợp lệ")
    }
}
let status = login(username: "haha", password: "1111111111")
switch status{
case .success(let message):
    print(message)
case .failure(error: let error):
    loginErrorMessage(error: error)
}
