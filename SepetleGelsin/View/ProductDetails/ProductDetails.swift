import SwiftUI
import Kingfisher

struct ProductDetails: View {
    
    @ObservedObject var item: ProductViewModel
 
    var productItem: Product
    
    var productItemIndex: Int {
        item.productList.firstIndex(where: { $0.id == productItem.id })!
    }

    var body: some View {
        ScrollView {
            
            ProductImage(imageUrl: productItem.imageUrl)
//                .offset(y: -UIScreen.main.bounds.height * 0.15)
                .padding(.top, 100)

            VStack(alignment: .leading) {
                HStack {
                    Text(productItem.title)
                        .padding(.bottom)
                        .font(.title)
                        .foregroundColor(.primary)
//Favorite Button
//                    FavoriteButton(isSet: $item.productList[productIndex].isFavorite)
                        }
                
//                FavoriteButton(isSet: $item.productList[productItemIndex].isFavorite)

                HStack {
                    Text("\(productItem.price)")
                    Spacer()
                    Text("product")
                }
                
                .font(.subheadline)
                .foregroundColor(.secondary)

                Divider()

               
                Text(productItem.description)
            }
            .padding()
            
        }
        .navigationTitle(productItem.title)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let item = ProductViewModel()
    static var previews: some View {
        ProductDetails(item: item, productItem: AB[0])
    }
}
