//
//  ShoppingCartVM.swift
//  SepetleGelsin
//
//  Created by Tolga Kağan Aysu on 30.12.2024.
//

import Foundation

final class ShoppingCartVM: ObservableObject {
    @Published private(set) var shoppingCartList = [ProductModel: Int]()

    var totalPrice: Double { shoppingCartList.reduce(0) { total, product in
        total + product.key.price * Double(product.value)
    }}

    func appendProduct(_ product: ProductModel, quantity: Int = 1) {
        if let appended = shoppingCartList[product] {
            let updatedQuantity = appended + quantity
            shoppingCartList[product] = updatedQuantity
        } else {
            shoppingCartList[product] = quantity
        }
    }

    func decreaseQuantity(_ product: ProductModel) {
        guard let quantity = shoppingCartList[product] else { return }
        if quantity == 1 {
            shoppingCartList.removeValue(forKey: product)
        } else {
            shoppingCartList[product] = quantity - 1
        }
    }

    func increaseQuantity(_ product: ProductModel) {
        appendProduct(product)
    }

    func clearCart() {
        shoppingCartList.removeAll()
    }

    func getQuantity(_ product: ProductModel) -> Int {
        guard let quantity = shoppingCartList[product] else { return 0 }
        return quantity
    }
}
