import SwiftUI
import Combine
struct FavoriteButton: View {
    @EnvironmentObject var viewModel: ProductViewModel
    var productDetailsItem: ProductModel
    
    func isFavoritee() -> Bool {
        for element in viewModel.favoriteList {
            if element.id == productDetailsItem.id {
                return true
            }
        }
        return false
    }
    
    
  
    var body: some View {
        Button(action: {
            if !isFavoritee(){
                print(productDetailsItem.id)
                addFavorite()
            }
            else {
                removeFavorite()
            }
            
        }){
            Image(systemName: "star.fill")
                .foregroundColor( isFavoritee() ? Color.yellow: Color.gray)
        }
    }
}
//
//struct FavoriteButton_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoriteButton(productDetailsItem: A)
//    }
//}
 


