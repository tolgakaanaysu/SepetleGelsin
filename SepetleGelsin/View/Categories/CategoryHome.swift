import SwiftUI
import Kingfisher

struct CategoryHome: View {
    
//    @ObservedObject var item = ProductListViewModel()
    @EnvironmentObject var eo : ProductListViewModel

    
    var body: some View {
        NavigationView {
            List {
                
                KFImage(URL(string: eo.productList[1].imageUrl))
                    
                    .resizable()
                    .scaledToFill()
                    .frame(height: UIScreen.main.bounds.height * 0.25)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                

                ForEach(item.ca categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: Product.categories[key]!)
                }
                          
            }
            .listRowInsets(EdgeInsets())
            .listStyle(.inset)
            .navigationTitle("Featured")
            
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
    }
}
