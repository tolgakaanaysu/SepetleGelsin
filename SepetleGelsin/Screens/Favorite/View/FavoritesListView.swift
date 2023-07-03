
import SwiftUI

struct FavoritesListView: View {
    // MARK: - Properities
    @EnvironmentObject private var viewModel: FavoriteVM
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            List (viewModel.favoriteList) { item in
                NavigationLink {
                    ProductDetailsView(productDetailsItem: item)
                } label: {
                    FavoriteListRowView(favoriteProducts: item )
                }
            }
            .navigationTitle("Favoriler")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    FavoriteListClearButtonView()
                }
            }
        }
    }
}

struct FavoritesList_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesListView()
            .environmentObject(FavoriteVM())
    }
}
