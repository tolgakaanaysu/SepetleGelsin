import SwiftUI
struct ProductImage: View {
    var image: Image
    
    var body: some View {
       
          image
            .frame(width: 200, height: 200, alignment: .center)
            .aspectRatio(contentMode: .fit)
            .shadow(radius: 10)

    }
}
struct ProductImage_Previews: PreviewProvider {
    static var previews: some View {
        ProductImage(image: ProductViewModel().productList[1].image )
    }
}
