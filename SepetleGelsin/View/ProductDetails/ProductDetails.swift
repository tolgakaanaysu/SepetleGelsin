import SwiftUI

struct ProductDetails: View {
    
    var productDetailsItem: ProductModel
    
    
    var body: some View {
        
        ScrollView {
            
        
           
                
                ProductImage(image: productDetailsItem.image)
                .offset(y: -10)

                Divider()
                VStack(alignment: .leading) {
                   
                        HStack {
                            Text(String(format:"%.2f",productDetailsItem.price) + "₺")
                                .frame(width: 100, height: 20, alignment: .center)
                                .font(.body)
                                
                            Spacer()
                         
                            Text(String(format: "%.1f", productDetailsItem.rating.rate))
                                .frame(width: 100, height: 20, alignment: .center)
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        Divider()
                        Text(productDetailsItem.description)
                   
                }
            
//            .navigationBarTitleDisplayMode(.inline)
        }
        .padding()
        .toolbar {
            ToolbarItemGroup {
                
                
                FavoriteButton(productDetailsItem: productDetailsItem)

            }
        }
        
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let product = ProductViewModel()
    static var previews: some View {
        ProductDetails(productDetailsItem: product.productList[1])
            .environmentObject(product)
    }
}
