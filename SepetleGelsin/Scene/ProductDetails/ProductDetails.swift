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
                         
                    FavoriteButton(productDetailsItem: productDetailsItem)
                        
                }
                .padding()
                .frame(width: getScreen().width, height: 75)
            
                Divider()
            
            Text(productDetailsItem.description)
                
            
            Spacer()
            AddToCartButton(product: productDetailsItem)
                
                
               
                   
                
        }
        .padding()
        
           
        
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let product = HomepageVM()
    static var previews: some View {
        ProductDetails(productDetailsItem: product.productList[1])
            .environmentObject(product)
    }
}
