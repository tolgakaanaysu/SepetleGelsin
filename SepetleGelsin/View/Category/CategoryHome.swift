import SwiftUI

struct CategoryHome: View {
    
    @EnvironmentObject private var viewModel : ProductViewModel

    var body: some View {
        
        NavigationView {
           
            List {
                Image(systemName: "logo.jpeg")
                    .resizable()
                    .frame(width: getScreen().width  ,height: getScreen().height * 0.2, alignment: .center)
                    .scaledToFill()
                    .listRowInsets(EdgeInsets())
                    
        
                ForEach(viewModel.categories.keys.sorted(), id:\.self ) { key in
                    
                    CategoryRow(catogoryName: key, productArray: viewModel.categories[key]!)
            
                }
            
            }//:List
            .listStyle(.inset)
            .navigationTitle("Home Page")
            .navigationBarTitleDisplayMode(.inline)
            
        }//:NavigationView
        
    }
        
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        
        CategoryHome()
            .environmentObject(ProductViewModel())
            
    }
}
