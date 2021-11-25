import SwiftUI

struct FavoriteListRow: View {
    var favoriteProducts: ProductModel
    
    var body: some View {
        HStack {

//                .resizable()
//                .frame(width: 50, height: 50)
            Text(favoriteProducts.title)
            Spacer()
            
        }
    }
}

struct FavoriteListRow_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteListRow(favoriteProducts: AB[1])
    }
}
