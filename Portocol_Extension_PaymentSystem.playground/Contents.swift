import Foundation

struct Order{
    let id: String
    var amount: Double
}

enum PaymentStatus{
    case success
    case failed(reason: String)
}

protocol PaymentMethod{
    var name: String { get }
    func pay(order:Order) -> PaymentStatus
}

extension PaymentMethod{
    func printResult(for order:Order){
        let status = pay(order: order)
        
        switch status{
        case .success:
            print("[\(name)]-Order: \(order.id)-PAY SUCCESS-Amount:\(order.amount)")
        case .failed(let reason):
            print("[\(name)]-Order: \(order.id)-PAY Failed:\(reason)-Amount:\(order.amount)")
        }
    }
}

struct CashPayment:PaymentMethod{
    var name: String = "Cash"
    
    func pay(order: Order) -> PaymentStatus {
        .success
    }
    
    
}

struct CardPayment:PaymentMethod{
    var name: String = "Card"
    var limit: Double
    
    func pay(order: Order) -> PaymentStatus {
        guard order.amount <= limit else{
            return .failed(reason: "Vượt quá \(limit)")
        }
        return .success
    }
    
    
}

final class EWalletPayment:PaymentMethod{
    private(set) var blance:Double
    var name: String = "EWallet"
    
    init(blance: Double) {
        self.blance = blance
    }
    
    func pay(order: Order) -> PaymentStatus {
        guard order.amount <= blance else{
            return .failed(reason: "Số dư ko đủ:\(blance)")
        }
        blance -= order.amount
        return .success
    }
    
    
}

let orderA = Order(id: "S01", amount: 120)
let orderB = Order(id: "S02", amount: 600)

let cash = CashPayment()
let card = CardPayment(limit: 500)
let wallet = EWalletPayment(blance: 200)

cash.printResult(for: orderA)
cash.printResult(for: orderB)
card.printResult(for: orderA)
card.printResult(for: orderB)
wallet.printResult(for: orderA)
wallet.printResult(for: orderB)
wallet.printResult(for: orderA)
print("Số hiện tại \(wallet.blance)")
