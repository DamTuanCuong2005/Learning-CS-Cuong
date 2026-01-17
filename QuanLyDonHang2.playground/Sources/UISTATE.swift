enum Screen {
    case login
    case orderList
    case orderDetail
    case payment
}

struct UiState {
    let screen: Screen
    let status: String
    let message: String
}

func UiStatus(search: SearchOrderStatus) -> UiState{
    switch search{
    case .emptyKeyword:
        return UiState(screen: .orderList, status: "error", message: "Lỗi")
    case .found:
        return UiState(screen: .orderDetail, status: "Success", message: "Thành công")
    case .notFound:
        return UiState(screen: .orderList, status: "empty", message: "rỗng")
    }
}
