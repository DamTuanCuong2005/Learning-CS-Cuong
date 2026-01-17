enum SearchOrderStatus{
    case emptyKeyword
    case found
    case notFound
    
    var message: String{
        switch self{
        case .emptyKeyword:
            return "key rỗng"
        case .found:
            return "Tìm thấy"
        case .notFound:
            return "Không tìm thấy"
        }
    }
}
