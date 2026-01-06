import Foundation
enum RegistrationError: Error{
    case isEmpty
    case tooshort
    case mustcontainnumber
}
func register(username: String, password: String) throws -> String{
    if username.isEmpty{
        throw RegistrationError.isEmpty
    }
    if password.count < 6{
        throw RegistrationError.tooshort
    }
    if password.rangeOfCharacter(from: .decimalDigits) == nil{
        throw RegistrationError.mustcontainnumber
    }
    return "Username,Password Ok"
}
do{
    try register(username: "admin", password: "000000")
    print("Username,Password Ok")
}catch RegistrationError.isEmpty{
    print("Username rỗng")
}catch RegistrationError.tooshort{
    print("Mật khẩu quá ngắn")
}catch RegistrationError.mustcontainnumber{
    print("Mật khẩu phải chứa 1 chữ số")
}catch{
    print("Lỗi khác \(error)")
}

