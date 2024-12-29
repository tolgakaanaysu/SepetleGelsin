import SwiftUI
 
extension SearchView {

    var filtredProduct : [ProductModel] {
        return viewModel.productList.filter {
            $0.title.lowercased().contains(searchText.lowercased())
        }        
    }
}
