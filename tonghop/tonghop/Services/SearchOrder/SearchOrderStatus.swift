enum SearchOrderStatus{
    case emptyKeyWord
    case found
    case notFound
    
    var message: String{
        switch self{
        case .emptyKeyWord:
            return "KeyWord Rỗng"
        case .found:
            return "Đã tìm thấy Order"
        case .notFound:
            return "Không tìm thấy"
        }
    }
}
