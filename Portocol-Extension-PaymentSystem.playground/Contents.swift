import Foundation
 
struct Order {
    let id: String
    let amount: Double
}
enum PaymentStatus {
    case success
    case failed(reason: String)
}
protocol PaymentMethod {
    var name: String { get }
    func pay(order: Order) -> PaymentStatus
}
 
extension PaymentMethod {
    func printResult(for order: Order) {
        let status = pay(order: order)
 
        switch status {
        case .success:
            print("[\(name)] Order \(order.id) - PAID SUCCESS (amount: \(order.amount))")
        case .failed(let reason):
            print("[\(name)] Order \(order.id) - PAID FAILED (amount: \(order.amount)) | reason: \(reason)")
        }
    }
}
 
struct CashPayment: PaymentMethod {
    let name: String = "Cash"
 
    func pay(order: Order) -> PaymentStatus {
        .success
    }
}
 
struct CardPayment: PaymentMethod {
    let limit: Double
    let name: String = "Card"
 
    func pay(order: Order) -> PaymentStatus {
        guard order.amount <= limit else {
            return .failed(reason: "Amount exceeds card limit (\(limit))")
        }
        return .success
    }
}
 
struct ViTraSauPayment: PaymentMethod {
    var type: String?
    let limit: Double
    var name: String
    
    func pay(order: Order) -> PaymentStatus {
        guard let type = type, order.amount <= limit else {
            return .failed(reason: "Không nhà cung cấp")
        }
        
        return .success
    }
    
    
}
 
// Vì pay() trong protocol là non-mutating, cách sạch nhất là dùng class (reference type) để trừ balance.
final class EWalletPayment: PaymentMethod {
    private(set) var balance: Double
    let name: String = "E-Wallet"
 
    init(balance: Double) {
        self.balance = balance
    }
 
    func pay(order: Order) -> PaymentStatus {
        guard order.amount <= balance else {
            return .failed(reason: "Insufficient balance (balance: \(balance))")
        }
        balance -= order.amount
        return .success
    }
}
 
// Demo
let orderA = Order(id: "A001", amount: 120)
let orderB = Order(id: "B001", amount: 600)
 
let cash = CashPayment()
let card = CardPayment(limit: 500)
let wallet = EWalletPayment(balance: 200)
 
cash.printResult(for: orderA)   // success
card.printResult(for: orderA)   // success
card.printResult(for: orderB)   // failed (vượt limit)
 
wallet.printResult(for: orderA) // success, balance còn 80
wallet.printResult(for: orderA) // failed, không đủ tiền
print("Wallet balance now: \(wallet.balance)")
 
