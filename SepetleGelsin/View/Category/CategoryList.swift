import SwiftUI

struct CategoryList: View {
    var productArray:  [ProductModel]
    
    var body: some View {
       Text("Tolga")
        
    }
}

struct CategoryList_Previews: PreviewProvider {
    static var previews: some View {
        CategoryList(productArray: ProductViewModel().productList)
    }
}
