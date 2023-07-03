import Foundation

final class HomepageVM: ObservableObject {
    // MARK: - Properties
    @Published var allProductList: [ProductModel] = DataManager.shared.loadData("data.json")
    @Published var shoppingCartList = [ProductModel]()
    @Published var productQuantityDict: [Int : Int] = [:]
//    @Published var searchText: String = "" {
//        didSet {
//            filtredProduct = productList.filter { $0.title.lowercased().contains(searchText.lowercased()) }
//        }
//    }
    var totalPrice: String { calculateTotalPrice() }
    var categories: [String: [ProductModel]] {
        Dictionary(
            grouping: allProductList,
            by: { $0.category.rawValue }
        )
    }
    
    var filtredProduct : [ProductModel] = []
    
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


