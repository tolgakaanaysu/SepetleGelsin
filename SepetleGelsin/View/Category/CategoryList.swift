import SwiftUI

struct CategoryList: View {
    var productArray:  [ProductModel]
    
    var body: some View {
        ScrollView(.vertical , showsIndicators: false) {
            VStack(alignment: .leading, spacing: 10) {
                ForEach(productArray) { item in
                    NavigationLink {
                        ProductDetails(productDetailsItem: item)
                    } label: {
                        CategoryItem(product: item)
                    }
                }
            }
        }
    }
}

struct CategoryList_Previews: PreviewProvider {
    static var previews: some View {
        CategoryList(productArray: AB)
    }
}
