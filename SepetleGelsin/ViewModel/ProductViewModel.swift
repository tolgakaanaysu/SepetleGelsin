import Foundation

final class ProductViewModel: ObservableObject {
    
    
    @Published var productList: [ProductModel] = DataService().loadData("data.json")
    @Published var favoriteList =  [ProductModel]()
    @Published var shoppingCartList = [ProductModel]()
    @Published var productQuantityDict: [Int : Int] = [:]
    
    var totalPrice: String { calculateTotalPrice() }
    var categories: [String: [ProductModel]] {
        Dictionary(
            grouping: productList,
            by: { $0.category.rawValue }
        )
    }
    
    //Calculate Total Price...
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


