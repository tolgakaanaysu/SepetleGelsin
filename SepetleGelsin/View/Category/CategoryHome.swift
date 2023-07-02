import SwiftUI

struct CategoryHome: View {
    
    @EnvironmentObject private var viewModel : ProductViewModel
    
    var body: some View {
        
        NavigationView {
            List(viewModel.categories.keys.sorted(), id:\.self ){ key in
                CategoryRow(catogoryName: key, productArray: viewModel.categories[key]!)
            }
        }
        .listStyle(.inset)
        .navigationTitle("Anasayfa")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        
        CategoryHome()
            .environmentObject(ProductViewModel())
        
    }
}
