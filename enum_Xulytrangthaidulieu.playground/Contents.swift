import Foundation
enum LoadState{
    case idle
    case loading
    case success(dataCount:Int)
    case empty
    case failure(errorMessage: String)
}
var data: Int = 0
@MainActor func handleLoadState(state: LoadState){
    switch state{
    case .idle:
        print("Bắt đầu tải")
    case .loading:
        print("Đang tải")
    case .success(dataCount: let dataCount):
        print("Tải thành công dữ liệu: \(dataCount)")
        data = dataCount
    case .empty:
        print("Không có dữ liệu")
    case .failure(errorMessage: let errorMessage):
        print("Là vì \(errorMessage)")
    }
}
handleLoadState(state: .success(dataCount: 2))
print(data)
handleLoadState(state: .failure(errorMessage: "Sai mật khẩu"))
