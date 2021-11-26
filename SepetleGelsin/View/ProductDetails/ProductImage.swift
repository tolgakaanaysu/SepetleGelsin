import SwiftUI
struct ProductImage: View {
    var image: Image
    
    var body: some View {
       
          image
            
            .resizable()
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .padding()
            .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.width * 0.5)
            
            .shadow(color: .blue, radius: 5)
            .padding()
        
        
    }
}
struct ProductImage_Previews: PreviewProvider {
    static var previews: some View {
        ProductImage(image: ProductViewModel().productList[1].image )
    }
}
