import SwiftUI
import Kingfisher

struct CategoryItem: View {
    var product:  ProductModel
    
    var body: some View {
        VStack(alignment: .leading) {
            KFImage(URL(string: product.imageUrl))
                .renderingMode(.original)
                .resizable()
                .frame(width: 150, height: 150)

                .clipShape(RoundedRectangle(cornerRadius: 15))
                .shadow(color: .blue, radius: 5)

            Text(product.title)
                .frame(width: 110, height: 20, alignment: .leading)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.trailing, 15)
        .padding(.top, 10)
    }
}


struct CategoryItem_Preview: PreviewProvider {
    static var previews: some View {
        CategoryItem(product: AB[1])
    }
}

