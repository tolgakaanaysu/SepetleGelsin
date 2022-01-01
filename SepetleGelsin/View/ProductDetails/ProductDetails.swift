import SwiftUI

struct ProductDetails: View {
    
    var productDetailsItem: ProductModel
    
    
    var body: some View {
        
        VStack{
            
                ProductImage(image: productDetailsItem.image)
                
                HStack {
                    
                    Text(String(format:"%.2f",productDetailsItem.price) + "₺")
                    
                        .frame(width: 100, height: 20,
                               alignment: .center)
                        .font(.body)
                                
                    Spacer()
                         
                    Text(String(format: "%.1f", productDetailsItem.rating.rate))
                            .frame(width: 100, height: 20, alignment: .center)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                }
                Divider()
            
                Text(productDetailsItem.description)
                
            
            Spacer()
            AddToCartButton(product: productDetailsItem)
                
                
                .toolbar {
                    FavoriteButton(productDetailsItem: productDetailsItem)
                }
        }
        .padding()
           
        
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let product = ProductViewModel()
    static var previews: some View {
        ProductDetails(productDetailsItem: product.productList[1])
            .environmentObject(product)
    }
}
