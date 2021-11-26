import SwiftUI

struct CategoryItem: View {
    var product:  ProductModel
    
    var body: some View {
        VStack(alignment: .leading) {
            product.image
            .renderingMode(.original)
            .resizable()
            .frame(width: 120 , height: 120)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(color: .blue, radius: 5)
       
                

            Text(product.title)
                .frame(width: 110, height: 20, alignment: .leading)
                .foregroundColor(.primary)
                .font(.caption)
        }
       
        .padding(.top, 10)
    }
}


struct CategoryItem_Preview: PreviewProvider {
    static var previews: some View {
        CategoryItem(product: ProductViewModel().productList[1])
    }
}

