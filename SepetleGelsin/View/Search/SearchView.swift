import SwiftUI

struct SearchView: View {
    @EnvironmentObject private var viewModel:  HomepageVM
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            List(viewModel.allProductList){ element in
                NavigationLink(element.title) {
                    ProductDetailsView(productDetailsItem: element)
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

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(HomepageVM())
    }
}
