import SwiftUI
import Kingfisher
import Combine
struct CategoryHome: View {
    
    @EnvironmentObject var productObject: ProductViewModel

     
    var body: some View {
        
        NavigationView {
            List {
                KFImage(URL(string: "https://www.cumhuriyet.com.tr/Archive/2021/7/31/1856842/kapak_145858.jpeg"))
                    .resizable()
                    .scaledToFill()
                    .frame(height: UIScreen.main.bounds.height * 0.25)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                    
                ForEach(productObject.categories.keys.sorted(), id:\.self ) { key in
                    
                    CategoryRow(catogoryName: key, productArray: productObject.categories[key]!)
                }
            }
            .listRowInsets(EdgeInsets())
            .listStyle(.inset)
            .navigationBarTitle("Home Page")
            
        }
    }
        
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        
        CategoryHome()
            .environmentObject(ProductViewModel())
            
    }
}
