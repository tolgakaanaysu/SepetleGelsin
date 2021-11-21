import SwiftUI
import Kingfisher

struct FavoriteListRow: View {
    var favoriteProducts: ProductModel
    
    var body: some View {
        HStack {
            KFImage(URL(string: favoriteProducts.imageUrl)!)
                .resizable()
                .frame(width: 50, height: 50)
            Text(favoriteProducts.title)
            Spacer()
            
            FavoriteButton(productDetailsItem: favoriteProducts)
        }
    }
}

struct FavoriteListRow_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteListRow(favoriteProducts: AB[1])
    }
}
