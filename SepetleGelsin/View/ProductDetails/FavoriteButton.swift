import SwiftUI
import Combine
struct FavoriteButton: View, Favorite {
  
    @EnvironmentObject var viewModel: ProductViewModel
    var productDetailsItem: ProductModel
    
  
    
    var body: some View {
        Button(action: {
            if isFavorite(productDetailsItem: productDetailsItem, viewModel: viewModel){
                addFavorite(productDetailsItem: productDetailsItem, viewModel: viewModel)
            }
            removeFavorite(productDetailsItem: productDetailsItem, viewModel: viewModel)
        }){
            Image(systemName: "star.fill")
                .foregroundColor( isFavorite(productDetailsItem: productDetailsItem, viewModel: viewModel) ? Color.yellow: Color.gray)
        }
    }
}
//
//struct FavoriteButton_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoriteButton(productDetailsItem: A)
//    }
//}
 


