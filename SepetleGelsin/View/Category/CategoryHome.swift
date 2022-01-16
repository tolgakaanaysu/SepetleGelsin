import SwiftUI

struct CategoryHome: View {
    
    @EnvironmentObject private var viewModel : ProductViewModel
    
    
    init() {
        UINavigationBar.appearance().backgroundColor = .navigationBarColor
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = .white
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]

    }

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
