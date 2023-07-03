import Foundation

final class CartVM: ObservableObject {
    // MARK: - Properties
    @Published var shoppingCartList = [ProductModel]()
    @Published var productQuantityDict: [Int : Int] = [:]
    
    var totalPrice: String { calculateTotalPrice() }
    
    // MARK: - Private Functions
    private func calculateTotalPrice() -> String {
        var totalPrice = 0.0
        var price = 0.0
        
        if !shoppingCartList.isEmpty {
            shoppingCartList.forEach { product in
                
                price = product.price * Double(productQuantityDict[product.id]!)
                totalPrice += price
            }
        }
        return String(format: "%.2f", totalPrice)
    }
}
