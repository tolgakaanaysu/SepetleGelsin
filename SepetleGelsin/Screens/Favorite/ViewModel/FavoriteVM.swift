import Foundation

final class FavoriteVM: ObservableObject {
    
    // MARK: - Properties
    @Published var favoriteList =  [ProductModel]()
    var listIsEmpty: Bool { favoriteList.isEmpty }
    
    // MARK: - Functions
    func addToFavoriteList(_ item: ProductModel) {
        favoriteList.append(item)
    }
    
    func removeToFavoriteList(_ item: ProductModel) {
        favoriteList.remove(item: item)
    }
    
    func clearFavoriteList() {
        favoriteList.removeAll()
    }
}
