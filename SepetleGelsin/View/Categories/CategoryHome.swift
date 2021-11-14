import SwiftUI
import Kingfisher

struct CategoryHome: View {
    
    @ObservedObject var item: ProductViewModel

     
    
    var body: some View {
        
        NavigationView {
            List {
                Button(action: {
                    print(item.productList[1].imageUrl)
                    
                }){
                    Image(systemName: "star.fill")
                        
                }
                
                KFImage(URL(string: "https://www.cumhuriyet.com.tr/Archive/2021/7/31/1856842/kapak_145858.jpeg"))
                    .resizable()
                    .scaledToFill()
                    .frame(height: UIScreen.main.bounds.height * 0.25)
                    .clipped()
                    .listRowInsets(EdgeInsets())

//                AsyncImage(url: URL(string: item.productList[1].imageUrl)) { image in
//                     image
//                        .resizable()
//                        .scaledToFill()
//                        .frame(height: UIScreen.main.bounds.height * 0.25)
//                        .clipped()
//                        .listRowInsets(EdgeInsets())
//                } placeholder: {
//                    Text("Wait")
//                }

                
                
                ForEach(item.categories.keys.sorted(), id:\.self ) { key in
                    
                    CategoryRow(catogoryName: key, item: item.categories[key]!)
                }
            }
            .listRowInsets(EdgeInsets())
            .listStyle(.inset)
            .navigationTitle("Home Page")
        }
       
       
        
       
    
    }
        
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome(item: ProductViewModel())
            
    }
}
