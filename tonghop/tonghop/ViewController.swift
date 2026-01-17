//
//  ViewController.swift
//  tonghop
//
//  Created by Tuấn Cường on 17/1/26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let product = [
            Product(id: 21, name: "Áo", price: 200),
            Product(id: 22, name: "Quần", price: 100),
            Product(id: 23, name: "Dép", price: 300)
        ]
        
        let user = [
            User(id: 30, name: "Đàm Tuấn Cường", isActive: true),
            User(id: 35, name: "Đàm Vĩnh Hưng", isActive: false),
            User(id: 40, name: "Trần Nguyễn Minh Phi", isActive: true)
        ]
        
        let order = [
            Order(orderId: 21, userId: 30, product: product),
            Order(orderId: 22, userId: 35, product: product),
            Order(orderId: 23, userId: 40, product: [])
        ]
        
        let userCheck = UserService()
        
        let TotalPrice = TotalPriceService()
        
        let SearchOrder = SearchOrderService()
        
        let payment = PaymentService()
        
        let ordersv = OrderService()
        
        print(userCheck.CheckUserStatus(user: user, userId: 21).message)
        
        print(ordersv.validateOrder(order: order.first))
        
        print(payment.payment(TotalPrice: 200))
        
        TotalPrice.caculatorTotalPrice(products: product){status,total in
            print(status.self)
            let paymentstatus = payment.payment(TotalPrice: total)
            print(paymentstatus.self)
        }
        
        print(SearchOrder.searchOrderByProductName(keyword: "Áo", orders: order))
        
    }
    


}

