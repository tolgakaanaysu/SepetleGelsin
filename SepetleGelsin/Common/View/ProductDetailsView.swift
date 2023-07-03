import SwiftUI

struct ProductDetailsView: View {
    
    var productDetailsItem: ProductModel
    
    var body: some View {
        VStack{
            ProductImageView(image: productDetailsItem.image)
            HStack {
                Text(String(format:"%.2f",productDetailsItem.price) + "₺")
                    .frame(width: 100, height: 20,
                           alignment: .center)
                    .font(.body)
                Spacer()
                FavoriteButtonView(selectedProduct: productDetailsItem)
            }
            .padding()
            .frame(width: getScreenBound().width, height: 75)
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
        ProductDetailsView(productDetailsItem: product.allProductList[1])
    }
}
