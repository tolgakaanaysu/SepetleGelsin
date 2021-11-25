import SwiftUI
import Combine
struct CategoryHome: View {
    
    @EnvironmentObject var productObject: ProductViewModel

     
    var body: some View {
        
        NavigationView {
            
            List {
                AsyncImage(url: URL(string: "https://micoedward.com/wp-content/uploads/2018/04/Love-your-product.png")) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: UIScreen.main.bounds.width, height: 200,alignment: .center)
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
