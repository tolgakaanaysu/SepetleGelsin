import Foundation


class ProductViewModel: ObservableObject {
    @Published var productList = [Product]()
    
    var categories: [String: [Product]] {
            Dictionary(
                grouping: productList,
                by: { $0.category.rawValue }
            )
        }
        
    func getData() {
        let webService = WebService()
        let url = URL(string: "https://fakestoreapi.com/products")
  
        webService.getData(url: url!, completion: { result in
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

