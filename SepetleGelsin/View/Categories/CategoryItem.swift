import SwiftUI
import Kingfisher

struct CategoryItem: View {
    var product:  Product
    
    var body: some View {
        VStack(alignment: .leading) {
            KFImage(URL(string: product.imageUrl))
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            
            Text(product.title)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.trailing, 15)
    }
}
