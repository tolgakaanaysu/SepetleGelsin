import SwiftUI

struct CategoryRowView: View {
    var catogoryName: String
    var productArray: [ProductModel]

    var body: some View {
        VStack(alignment: .leading) {
            //Clicked category name
            NavigationLink{
                CategoryListView(catogoryName: catogoryName, productArray: productArray)
            } label: {
                Text(catogoryName)
                    .font(.title)
                    .bold()
                    .shadow(color: .black, radius: 0.2)
                    .padding(.top, 5)
            }

            //Clicked products
            ScrollView(.horizontal , showsIndicators: false) {
                HStack(alignment: .top, spacing: 30) {
                    ForEach(productArray) { item in
                        NavigationLink {
                            ProductDetailView(productDetailsItem: item)
                        } label: {
                            CategoryItemView(product: item)
                        }
                    }
                }
            }
        }
    }
}
