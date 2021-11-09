import Foundation
import Combine

class ProductListViewModel: ObservableObject {
    
    @Published var productList = [Product]()
    let webService = WebService()
    
   
    var categories: [String: [Product]] {
            Dictionary(
                grouping: productList,
                by: { $0.category.rawValue }
            )
        }
    
    
  
    
}

extension ProductListViewModel {
    func downloadData(url: URL) async {
        
        do {
            let product = try await webService.getData(url: url)

            DispatchQueue.main.async {
                self.productList = product.map(ProductViewModel.init)
            }

        } catch  {
            print("Error")
        }

    }
}

struct ProductViewModel {
    let productModel: Product
    
    
    var id: Int {
        productModel.id
    }
    
    var title: String {
        productModel.title
    }
    
    var price: Double {
        productModel.price
    }
    var description: String {
        productModel.description
    }
    var category: Category {
        productModel.category
    }
    
    var imageUrl: String {
        productModel.imageUrl
    }
    
    var rating: Rating {
        productModel.rating
    }
    
}
