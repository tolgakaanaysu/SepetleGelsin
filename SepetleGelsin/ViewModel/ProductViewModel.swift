import Foundation

class ProductViewModel: ObservableObject {
    
    //Product List...
    @Published var productList: [ProductModel] = DataService().loadData("data.json")
    
    //Liked Products...
    @Published var favoriteList =  [ProductModel]()
    
    //Shopping Cart List...
    @Published var shoppingCartList: [Int : Int] = [:]
    
    //Calculate Total Price...
    func calculateTotalPrice() -> Double {
        var totalPrice = 0.0
        var price = 0.0
            
        
        if !shoppingCartList.isEmpty {
            productList.forEach { product in
                shoppingCartList.forEach { key,value in
                    price = 0
                    if product.id == key {
                        price *= product.price * Double(value)
                    }
                }
                totalPrice += price
            }
        }
        
        return totalPrice
    }

    
    //Categorize Products...
    var categories: [String: [ProductModel]] {
            Dictionary(
                grouping: productList,
                by: { $0.category.rawValue }
            )
        }
}


