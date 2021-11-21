import SwiftUI
import Kingfisher

struct CategoryItem: View {
    var product:  ProductModel
    
    var body: some View {
        VStack(alignment: .leading) {
            KFImage(URL(string: product.imageUrl))
                .renderingMode(.original)
                .resizable()
                .frame(width: 100, height: 100)

                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: .red, radius: 5)
//                .cornerRadius(10)
                
            
            Text(product.title)
                .frame(width: 110, height: 20, alignment: .leading)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.trailing, 15)
    }
}


struct CategoryItem_Preview: PreviewProvider {
    static var previews: some View {
        CategoryItem(product: AB[1])
    }
}

