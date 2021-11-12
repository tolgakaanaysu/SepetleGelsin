import SwiftUI
import Kingfisher

struct CategoryHome: View {
    
    @ObservedObject var item: ProductListViewModel

    var body: some View {
        
        NavigationView {
            List {
                Button(action: {
                    print(item.productList[1].imageUrl)
                }){
                    Image(systemName: "star.fill")
                        
                }
//                KFImage(URL(string: item.productList[1].imageUrl)!)
//                    .resizable()
//                    .scaledToFill()
//                    .frame(height: UIScreen.main.bounds.height * 0.25)
//                    .clipped()
//                    .listRowInsets(EdgeInsets())
//
//                
                ForEach(item.categories.keys.sorted(), id:\.self ) { key in
                    
                    CategoryRow(catogoryName: key, item: item.categories[key]!)
                }
            }
            .listRowInsets(EdgeInsets())
            .listStyle(.inset)
            .navigationTitle("Home Page")
        }
        .onAppear(){
            ProductListViewModel().getData()
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome(item: ProductListViewModel())
            
    }
}
