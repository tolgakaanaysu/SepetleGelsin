import Foundation

struct pastOrders:Identifiable {
    var id: String = UUID().uuidString
    let productId: Int
    let quaintity: Int
    let price: Double
    let date: String
}
