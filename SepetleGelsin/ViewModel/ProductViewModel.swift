import Foundation

class ProductViewModel: ObservableObject {
    
    @Published var productList: [ProductModel] = DataService().loadData("data.json")
    @Published var favoriteList =  [ProductModel]()
    @Published var shoppingCartList = [ProductModel]()

    
    //Categorize Products
    var categories: [String: [ProductModel]] {
            Dictionary(
                grouping: productList,
                by: { $0.category.rawValue }
            )
        }
}


