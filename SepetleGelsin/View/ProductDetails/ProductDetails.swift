import SwiftUI

struct ProductDetails: View {
    
    var productDetailsItem: ProductModel
    
    
    var body: some View {
        
        ScrollView {
            Text(productDetailsItem.title)
                .font(.title)
            
            ProductImage(imageUrl: productDetailsItem.imageUrl)

            VStack(alignment: .leading) {
               
                    HStack {
                        Text(String(format:"%.2f",productDetailsItem.price) + "$")
                        Spacer()
                     
                        Text(String(format: "%.1f", productDetailsItem.rating.rate))
                             
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    Divider()
                    Text(productDetailsItem.description)
               
            }
            .navigationBarTitleDisplayMode(.inline)
        }
        .padding()
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing ) {
                
                
                FavoriteButton(productDetailsItem: productDetailsItem)

            }
        }
        
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    
    static var previews: some View {
        ProductDetails(productDetailsItem: AB[1])
    }
}
