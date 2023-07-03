import SwiftUI

struct FavoriteButtonView: View {
    // MARK: - Properties
    @EnvironmentObject private var favoriteVM: FavoriteVM
    private var productIsFavorite: Bool { favoriteVM.favoriteList.contains { $0.id == selectedProduct.id } }
    var selectedProduct: ProductModel
    
    // MARK: - Body
    var body: some View {
        Button(action: {
            if !productIsFavorite {
                favoriteVM.addToFavoriteList(selectedProduct)
            } else {
                favoriteVM.removeToFavoriteList(selectedProduct)
            }
        }){
            Image(systemName: "heart.fill")
                .resizable()
                .frame(width: 30, height: 30, alignment: .center)
                .foregroundColor(productIsFavorite ? Color.red: Color.gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButtonView(selectedProduct: HomepageVM().allProductList[1])
            .environmentObject(FavoriteVM())
    }
}



