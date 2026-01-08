import Foundation

enum AccessState{
    case underAge
    case noTicket
    case allowed
}
func Access(access:AccessState){
    switch access{
    case .underAge:
        print("Không đủ tuổi")
    case .noTicket:
        print("Không có vé")
    case .allowed:
        print("Được phép vào")
    }
}
func checkAccess(age: Int,hasTicket: Bool){
    if age < 9 {
        return Access(access: .underAge)
    }
    if hasTicket == false{
        return Access(access: .noTicket)
    }
    return Access(access: .allowed)
}
checkAccess(age: 10, hasTicket: true)
