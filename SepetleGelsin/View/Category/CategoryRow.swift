import SwiftUI

struct CategoryRow: View {
    var catogoryName: String
    var productArray: [ProductModel]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(catogoryName)
                .font(.title)
                .padding(.top, 5)

            ScrollView(.horizontal , showsIndicators: true) {
                HStack(alignment: .top, spacing: 0) {
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
}

struct CategoryRow_Provide: PreviewProvider {
    static var previews: some View {
        CategoryRow(catogoryName: "CategoryName", productArray: AB)
    }
}
