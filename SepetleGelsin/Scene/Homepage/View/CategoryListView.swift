import SwiftUI

struct CategoryListView: View {
    var catogoryName: String
    var productArray:  [ProductModel]
    var layout = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView {
            Text(catogoryName)
                .bold()
                .font(.largeTitle)
                .foregroundColor(Color.secondary)

            LazyVGrid(columns: layout) {
                ForEach(productArray) {product in
                    NavigationLink {
                        ProductDetails(productDetailsItem: product)
                    } label: {
                        CategoryItemView(product: product)
                    }
                }
            }
        }
    }
}
