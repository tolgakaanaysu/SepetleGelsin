import Foundation

class ProductViewModel: ObservableObject {
    @Published var productList = [ProductModel]()
    
    var categories: [String: [ProductModel]] {
            Dictionary(
                grouping: productList,
                by: { $0.category.rawValue }
            )
        }
    
    @Published var favoriteList = [ProductModel]()
    
    
}


extension ProductViewModel {
    
    func downloadDataFromUrl() {
        let webService = WebService()
        let urlString = "https://fakestoreapi.com/products"
        let url = URL(string: urlString)
  
        webService.getDataFromUrl(url: url!, completion: { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let item):
                if let item = item {
                    DispatchQueue.main.async {
                        self.productList = item
                    }
                   
                }
            }
        })
      
    }
}


extension ProductViewModel {
   
    func convertCategoryName(name: String) -> String {
        
        switch name {
   
        case "1" :
            return  "b"
        case "2" :
            return  "a"
        default:
            return  "c"
        }
    }
}

