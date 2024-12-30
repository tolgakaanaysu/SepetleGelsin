import SwiftUI

struct SearchView: View {
    @StateObject var viewModel = SearchViewModel()
    @EnvironmentObject var homepageVM: HomepageVM

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.filteredProducts){ element in
                    NavigationLink(element.title) {
                        ProductDetails(productDetailsItem: element)
                    }
                }
            }
            .padding(.top)
            .listStyle(.inset)
            .navigationTitle("Arama")
            .searchable(text: $viewModel.searchText)
            .navigationBarTitleDisplayMode(.inline)
            .onAppear() {
                viewModel.bind(productList: homepageVM.$productList)
            }
        }
    }
}
