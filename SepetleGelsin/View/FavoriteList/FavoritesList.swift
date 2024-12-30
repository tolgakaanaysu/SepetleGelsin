
import SwiftUI

struct FavoritesList: View {
    @EnvironmentObject var viewModel: FavoriteListVM

    var body: some View {
        NavigationView {
            
            List {
                ForEach(viewModel.favoriteList) { item in
                    NavigationLink {
                        ProductDetails(productDetailsItem: item)
                    } label: {
                       FavoriteItemRowView(favoriteProducts: item )
                    }
                }
            }
            .listStyle(.inset)
            .navigationTitle("Favoriler")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    TrashButtonView()
                }
            }
        }
    }
}

struct FavoritesList_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesList()
            .environmentObject(ProductViewModel())
    }
}
