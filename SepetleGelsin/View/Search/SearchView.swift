import SwiftUI

struct SearchView: View {
    @EnvironmentObject var viewModel:  ProductViewModel
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
          
    
          
            List(filtredProduct) { element in
                    
                    Text(element.title)
                    
                  
                }
               
                .listStyle(.inset)
                .navigationTitle("Search")
                .searchable( text: $searchText)
                
            
            }
            
            
            
            
            
    }
        
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(ProductViewModel())
    }
}
