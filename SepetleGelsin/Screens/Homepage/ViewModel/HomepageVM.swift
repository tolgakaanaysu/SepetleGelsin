import Foundation

final class HomepageVM: ObservableObject {
    // MARK: - Properties
    @Published var allProductList: [ProductModel] = DataManager.shared.loadData("data.json")
    var filtredProduct : [ProductModel] = []
    var categories: [String: [ProductModel]] {
        Dictionary(
            grouping: allProductList,
            by: { $0.category.rawValue }
        )
    }
}


