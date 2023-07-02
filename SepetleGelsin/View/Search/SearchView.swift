import SwiftUI

struct SearchView: View {
    @EnvironmentObject private var viewModel:  ProductViewModel
    @State private var searchText = ""

    var filtredProduct : [ProductModel] {
        return viewModel.productList.filter {
            $0.title.lowercased().contains(searchText.lowercased())
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filtredProduct){ element in
                    NavigationLink(element.title) {
                        ProductDetails(productDetailsItem: element)
                    }
                }
            }
            .padding(.top)
            .listStyle(.inset)
            .navigationTitle("Arama")
            .searchable(text: $searchText)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(ProductViewModel())
    }
}
