import SwiftUI

struct ProductImageView: View {
    var image: Image
    
    var body: some View {
       
          image
            
            .resizable()
            .clipShape(RoundedRectangle(cornerRadius: 15))
            
            .frame(width: UIScreen.main.bounds.width * 0.5,
                   height: UIScreen.main.bounds.width * 0.5)
            
            .shadow(color: .ourApplicationColor , radius: 5)
            .padding()
        
        
    }
}
struct ProductImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProductImageView(image: HomepageVM().allProductList[1].image )
    }
}
