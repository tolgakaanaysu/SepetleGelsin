import SwiftUI

struct CategoryHome: View {
    
    @EnvironmentObject private var viewModel : ProductViewModel
    
    
   

    var body: some View {
        
        NavigationView {
           
            List {
                  
                ForEach(viewModel.categories.keys.sorted(), id:\.self ) { key in
                    
                    CategoryRow(catogoryName: key, productArray: viewModel.categories[key]!)
            
                }
            
            }//:List
            .listStyle(.inset)
            .navigationTitle("Anasayfa")
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
