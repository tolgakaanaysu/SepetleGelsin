import SwiftUI
import Combine
struct FavoriteButton: View {
    @EnvironmentObject var viewModel: ProductViewModel
    var productDetailsItem: ProductModel
  
    var body: some View {
        Button(action: {
            if !isFavorite(){
                addFavorite()
            }
            else {
                removeFavorite()
              
            }
            
        }){
            Image(systemName: "heart.fill")
                .foregroundColor( isFavorite() ? Color.red: Color.gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(productDetailsItem: A)
            .environmentObject(ProductViewModel())
    }
}
 


