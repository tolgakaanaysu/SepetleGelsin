
import SwiftUI

struct ProductDetails: View {
    var item: Product
    var body: some View {
        ScrollView {
            
        }
    }
}

struct ProductDetails_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetails(item: ProductListViewModel().productList[1])
    }
}
