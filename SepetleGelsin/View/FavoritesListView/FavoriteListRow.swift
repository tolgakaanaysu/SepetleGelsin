import SwiftUI

struct FavoriteListRow: View {
    var favoriteProducts: ProductModel
    
    var body: some View {
        HStack {
            favoriteProducts.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(favoriteProducts.title)
            Spacer()
            
        }
    }
}

struct FavoriteListRow_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteListRow(favoriteProducts: HomepageVM().allProductList[1])
    }
}
