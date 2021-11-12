import SwiftUI
import Kingfisher

struct ProductDetails: View {
    
    @EnvironmentObject var item: ProductViewModel
    var product: Product
    var productIndex: Int {
        item.productList.firstIndex(where: { $0.id == product.id })!
    }

    var body: some View {
        ScrollView {
            

            KFImage(URL(string: product.imageUrl)!)
                .offset(y: -UIScreen.main.bounds.height * 0.15)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                HStack {
                    Text(product.title)
                        .font(.title)
                        .foregroundColor(.primary)
//Favorite Button
//                    FavoriteButton(isSet: $item.productList[productIndex].isFavorite)
                        
                }

                HStack {
                    Text("landmark.park")
                    Spacer()
                    Text("product")
                }
                .font(.subheadline)
                .foregroundColor(.secondary)

//                Divider()

               
                Text(product.description)
            }
            .padding()
            
        }
        .navigationTitle(product.title)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

//struct LandmarkDetail_Previews: PreviewProvider {
//    static let modelData = ModelData()
//
//    static var previews: some View {
//        LandmarkDetail(landmark: modelData.landmarkArray[1])
//            .environmentObject(modelData)
//    }
//}
