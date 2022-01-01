import Foundation

class ProductViewModel: ObservableObject {
    
    //Product List...
    @Published var productList: [ProductModel] = DataService().loadData("data.json")
    
    //Liked Products...
    @Published var favoriteList =  [ProductModel]()
    
    //Shopping Cart List...
    @Published var shoppingCartList = [ProductModel]()
    
    //Quantity of product in the cart...
    @Published var productQuantityDict: [Int : Int] = [:]
    
    //Calculate Total Price...
    func calculateTotalPrice() -> String {
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

    
    //Categorize Products...
    var categories: [String: [ProductModel]] {
            Dictionary(
                grouping: productList,
                by: { $0.category.rawValue }
            )
        }
}


