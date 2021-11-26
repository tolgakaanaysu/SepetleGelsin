import SwiftUI

struct CategoryRow: View {
    var catogoryName: String
    var productArray: [ProductModel]
    
    var body: some View {
        VStack(alignment: .leading) {
            NavigationLink{
                CategoryList(productArray: productArray)
            } label: {
                Text(catogoryName)
                    .font(.title)
                    .bold()
                    .shadow(color: .black, radius: 0.2)
                    .padding(.top, 5)
                   
                    
            }

            ScrollView(.horizontal , showsIndicators: false) {
                HStack(alignment: .top, spacing: 10) {
                    ForEach(productArray) { item in
                        NavigationLink {
                            ProductDetails(productDetailsItem: item)
                        } label: {
                            CategoryItem(product: item)
                        }
                    }
                } //:HStack
            } //:ScroolView
        }//:VStack
        
    }
}

struct CategoryRow_Provide: PreviewProvider {
    static var product = ProductViewModel().productList
    static var previews: some View {
        CategoryRow(catogoryName: product[1].category.rawValue, productArray: Array(product.prefix(4)))
    }
}
