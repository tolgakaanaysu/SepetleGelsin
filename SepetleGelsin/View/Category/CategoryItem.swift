import SwiftUI

struct CategoryItem: View {
    var product:  ProductModel
    
    var body: some View {
        //procuct image
        VStack(alignment: .leading) {
            product.image
            .renderingMode(.original)
            .resizable()
            .frame(width: getScreen().width * 0.25 , height: getScreen().width * 0.25)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(color: .blue , radius: 5)
            .padding(.leading, 5)
            
            
            //Product price text
            Text(String(format: "%.2f ₺", product.price))
                .frame(width: 110, height: 20, alignment: .center)
                .foregroundColor(.primary)
                .font(.headline)
                

            //Product Title text
            Text(product.title)
                .frame(width: 110, height: 20, alignment: .center)
                .foregroundColor(.secondary)
                .font(.headline)
        }
        .padding(.top, 10)
    }
}


struct CategoryItem_Preview: PreviewProvider {
    static var previews: some View {
        CategoryItem(product: ProductViewModel().productList[3])
    
    }
}
