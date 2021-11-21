
import SwiftUI

struct FavoritesList: View {
    @EnvironmentObject var viewModel: ProductViewModel
    
   
    
    var body: some View {
        NavigationView {
            
            List {
                ForEach(viewModel.favoriteList) { item in
                    NavigationLink {
                        ProductDetails(productDetailsItem: item)
                    } label: {
                       FavoriteListRow(favoriteProducts: item )
                    }
                }
            }
            .navigationTitle("Favorite")
        }
    }
}

struct FavoritesList_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesList()
            .environmentObject(ProductViewModel())
    }
}
