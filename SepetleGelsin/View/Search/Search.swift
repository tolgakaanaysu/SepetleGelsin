import SwiftUI
 
extension SearchView {

    var filtredProduct : [ProductModel] {
        if searchText == "" { return viewModel.productList }
        return viewModel.productList.filter {
            $0.title.lowercased().contains(searchText.lowercased())
        }
    }
}
