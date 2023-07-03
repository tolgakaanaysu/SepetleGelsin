import Foundation

struct PastOrderModel:Identifiable {
    var id: String = UUID().uuidString
    let productId: Int
    let quaintity: Int
    let price: Double
    let date: String
    var name: String = ""
    var imageName: String = ""
}
