import Foundation

enum OperationResult{
    case success(data:String)
    case failure(errorMessage: String)
}

func handleOperationResult(result: OperationResult){
    switch result{
    case .success(let data):
        print("Hệ Thống xử lý thành công với dữ liệu: \(data)")
    case .failure(let errorMessage):
        print("Hệ thống xử lý thất bại với dữ liệu: \(errorMessage)")
    }
}
handleOperationResult(result: .success(data: "Đăng nhập Trang Web thành công"))
handleOperationResult(result: .failure(errorMessage: "Không nhận kết nối mạng"))
