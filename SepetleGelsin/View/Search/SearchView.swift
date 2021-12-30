import SwiftUI

struct SearchView: View {
    @EnvironmentObject var viewModel:  ProductViewModel
    @State var searchText = ""
    
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
