import Foundation
func Password(_ password:String){
    while password.count == 3{
        print("Đã đăng nhập thành công")
        break
    }
    while password.count < 3{
        print("Password tối đa là 3")
        continue
    }
}
Password("haa")
