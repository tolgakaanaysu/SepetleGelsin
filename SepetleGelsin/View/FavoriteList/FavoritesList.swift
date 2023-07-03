
import SwiftUI

struct FavoritesList: View {
    @EnvironmentObject private var viewModel: FavoriteVM
    var body: some View {
        NavigationView {
            List (viewModel.favoriteList) { item in
                NavigationLink {
                    ProductDetails(productDetailsItem: item)
                } label: {
                    FavoriteListRow(favoriteProducts: item )
                }
            }
        }
        .listStyle(.inset)
        .navigationTitle("Favoriler")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem {
                RemoveButton()
            }
        }
        .onAppear(){
            print("ListPageCount")
            print(viewModel.favoriteList.count)
        }
    }
}

struct FavoritesList_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesList()
            .environmentObject(FavoriteVM())
    }
}
