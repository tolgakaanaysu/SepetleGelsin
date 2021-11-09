import Foundation
import Combine
class ModelData: ObservableObject {
    
   @Published var productList = [Product]()
    let webService = WebService()
    
   
    func downloadData(url: URL) async {
        
        do {
            let product = try await webService.getData(url: url)
            
            DispatchQueue.main.async {
                self.productList = product.map(ModelData.init)
            }
            
        } catch  {
            print("Error")
        }
        
    }
    
}
