import SwiftUI

struct HomepageView: View {
    
    @EnvironmentObject private var viewModel : HomepageVM
    
    var body: some View {
        
        NavigationView {
            List(viewModel.categories.keys.sorted(), id:\.self ){ key in
                CategoryRowView(catogoryName: key, productArray: viewModel.categories[key]!)
            }
        }
        .listStyle(.inset)
        .navigationTitle("Anasayfa")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView()
            .environmentObject(HomepageVM())
    }
}
