import SwiftUI

struct CategoryRow: View {
  
    var catogoryName: String
    var item: [Product]
    
    
var body: some View {
        VStack(alignment: .leading) {
            Text(catogoryName)
                .font(.title)
                .padding(.top, 5)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(item) { product in
                        NavigationLink {
                            ProductDetails(item: <#T##ProductViewModel#>, productItem: <#T##Product#>)
                        } label: {
                            CategoryItem(product: product)
                        }
                    }
                }
            }
            .frame(height: UIScreen.main.bounds.height * 0.21)
        }
    }
}

