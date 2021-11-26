import SwiftUI
import Combine
struct CategoryHome: View {
    
    @EnvironmentObject var productObject: ProductViewModel

     
    var body: some View {
        
        NavigationView {
            
            List {
                productObject.productList[2].image
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width  ,height: 200)
                    .scaledToFill()
                    
                    .listRowInsets(EdgeInsets())
                    
                    
                ForEach(productObject.categories.keys.sorted(), id:\.self ) { key in
                    
                    CategoryRow(catogoryName: key, productArray: productObject.categories[key]!)
                }
            }
            .listStyle(.inset)
           
           
            
        }
    }
        
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        
        CategoryHome()
            .environmentObject(ProductViewModel())
            
    }
}
