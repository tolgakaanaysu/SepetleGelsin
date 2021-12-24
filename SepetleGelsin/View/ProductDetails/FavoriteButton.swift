import SwiftUI
import Combine
struct FavoriteButton: View {
    @EnvironmentObject var viewModel: ProductViewModel
    var productDetailsItem: ProductModel
  
    func isFavorite() -> Bool {
        for element in viewModel.favoriteList {
            if element.id == self.productDetailsItem.id {
                return true
            }
        }
        return false
    }
    
    var body: some View {
        Button(action: {
            if !isFavorite(){
                viewModel.favoriteList.append(self.productDetailsItem)
            }
            else {
                    
                if let index = viewModel.favoriteList.firstIndex(where: {$0.id == productDetailsItem.id }) {
                    viewModel.favoriteList.remove(at: index)
                }
              
            }
            
        }){
            Image(systemName: "heart.fill")
                .foregroundColor( isFavorite() ? Color.red: Color.gray)
                
                
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(productDetailsItem: ProductViewModel().productList[1])
            .environmentObject(ProductViewModel())
    }
}
 


